# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_admin?
      can :read, :all
      can :manage, :all
      can :manage, :dashboard
      can :access, :rails_admin
    end
    if user.is_employee?
      can :read, :all
      can :read, :dashboard
      can :access, :rails_admin
    end
  end # See the wiki for details:
end
