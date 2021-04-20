# frozen_string_literal: true

require 'ffaker'

# This class describes Project Model
class Project
  attr_reader :name, :identifier, :description

  def initialize
    @name = FFaker::Product.product + FFaker::Internet.domain_word
    @identifier = FFaker::Lorem.word + FFaker::SSN.ssn.to_s
    @description = FFaker::Lorem.paragraph
  end
end
