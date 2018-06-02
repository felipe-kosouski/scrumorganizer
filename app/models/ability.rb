class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new
    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :read, :update, to: :read_update

    can :manage, Project, id: Project.with_role(:manager, user).pluck(:id)

    can :read_update, Project, id: Project.with_role(:master, user).pluck(:id)

    can :read, Project, id: Project.with_role(:developer, user).pluck(:id)

  end
end
