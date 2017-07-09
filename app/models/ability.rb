class Ability
  include CanCan::Ability

  def initialize user
    alias_action :update, :destroy, to: :modify
    alias_action :create, :modify, to: :full_pri
    return unless user
    if user.is_admin
      can :destroy, [Post, Comment]
    end
    user_id = user.id
    can :read, :all
    can :update, User, id: user_id
    can [:full_pri], Post, user_id: user_id
    can [:full_pri], Comment, user_id: user_id
  end
end
