# frozen_string_literal: true

require 'ffaker'

# This class describes User Model
class User
  attr_reader :user_name, :password, :first_name, :last_name, :email, :user_role

  def initialize(user_role = 'default')
    @user_name = FFaker::Identification.ssn
    @password = FFaker::Internet.password
    @first_name = FFaker::Name.first_name
    @last_name = FFaker::Name.last_name
    @email = FFaker::Internet.email
    @user_role = user_role
  end
end
