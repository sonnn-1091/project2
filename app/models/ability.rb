class Ability
  include CanCan::Ability

  def initialize user
    return unless user
    can :read, :all
    can [:update], User, id: user.id
    can [:update, :delete], Post, user_id: user.id
  end
end
