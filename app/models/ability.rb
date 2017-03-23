class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      user = User.new
      user.add_role(:unauth_poster)
    end
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :poster
      can :manage, Apartment, user_id: user.id
    elsif user.has_role? :unauth_poster
      can :read, Apartment
    end
  end
end
