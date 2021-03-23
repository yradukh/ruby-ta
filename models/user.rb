# frozen_string_literal: true

require 'ffaker'

# This class describes User Model
class User
  attr_reader :user_name, :password, :first_name, :last_name, :email

  def initialize
    @user_name = FFaker::Random.seed
    @password = FFaker::Internet.password
    @first_name = FFaker::Name.first_name
    @last_name = FFaker::Name.last_name
    @email = FFaker::Internet.email
  end
end
