# frozen_string_literal: true
require 'date'

class Shift
  #
  # Supports
  #
  attr_accessor :id, :planning_id, :user_id, :start_date, :day_name

  #
  # Public class methods
  #
  def initialize(attrs = {})
    @id          = attrs.fetch('id', nil)
    @planning_id = attrs.fetch('planning_id', nil)
    @user_id     = attrs.fetch('user_id', nil)
    @start_date  = attrs.fetch('start_date', nil)
    @day_name    = Date.parse(@start_date)&.strftime("%A")&.downcase unless @start_date.nil?
  end

  #
  # Public instance methods
  #

  #
  # Protected instance methods
  #
  # protected
end
