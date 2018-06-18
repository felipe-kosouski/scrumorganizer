# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/add_collaborator
  def add_collaborator
    project = Project.first
    UserMailer.add_collaborator(project)
  end

end
