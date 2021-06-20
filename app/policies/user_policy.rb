class UserPolicy < ApplicationPolicy

  def index?
    @user.admin?
  end

  def show?
    check_user
  end

  def edit?
    check_user
  end

  def update?
    check_user
  end

  def destroy?
    @user.admin?
  end

  private

  def check_user
    @user.admin? | @user.id.eql?(@record.id)
  end
end