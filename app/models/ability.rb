class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    return unless user.present?

    can :manage, Group, user_id: user.id
    can :manage, Bill, user_id: user.id
  end
end
