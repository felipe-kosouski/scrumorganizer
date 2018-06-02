namespace :db do

  desc "Erase and fill database"
  task :populate => :environment do

    [Role, UsersProject, Story, Board, Project, User].each(&:delete_all)

    Role.create!(name: :manager)
    Role.create!(name: :master)
    Role.create!(name: :developer)

    god_user = User.create!(name: 'Felipe Kosouski', username: 'felipe.kosouski', email: 'felipe.kosouski@gmail.com', password: '123456')

    20.times do
      User.create!(
          name: Faker::Name.name,
          username: Faker::Internet.user_name,
          email: Faker::Internet.unique.email,
          password: '123456'
      )
    end

    User.all.each do |user|
      2.times { user.projects.create! name: Faker::App.unique.name }
    end

    Project.all.each do |project|
      3.times { project.boards.create! name: Faker::Lovecraft.tome, position: 1.next }
    end

    Board.all.each do |board|
      4.times {board.stories.create! name: Faker::Lovecraft.sentence}
    end

  end
end