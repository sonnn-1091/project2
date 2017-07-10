class Ability
  include CanCan::Ability

  def initialize user
    return unless user
    if user.is_admin
      can :delete, Post
      can :delete, Comment
    end
    user_id = user.id
    can :read, :all
    can :update, User, id: user_id
    can [:update, :delete], Post, user_id: user_id
    can [:update, :delete], Comment, user_id: user_id
  end
end
