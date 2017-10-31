require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be unique" do
    user = create(:user, email: "bettymaker@gmail.com")
    user2 = build(:user, email: "bettymaker@gmail.com")
    user2.save
    refute user2.valid?
  end

  test "user must include password_confirmation on create" do
    user = build(:user, password_confirmation: nil)
    user.save
    refute user.valid?
  end

  test "password must match confirmation" do
    user = build(:user, password_confirmation: "87654321")
    user.save
    refute user.valid?
  end

  test "password must be at least 8 characters long" do
    user = build(:user, password: "1234", password_confirmation: "1234")
    user.save
    refute user.valid?
  end

  test "error messages displays if validations not met" do
    User.new(email: "bettymaker@gmail.com", password: "1234", password_confirmation: "1234")
    user = User.new(email: "bettymaker@gmail.com", password: "1234", password_confirmation: "1234")
    refute user.valid?
  end
end
