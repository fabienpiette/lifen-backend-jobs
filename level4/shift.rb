# frozen_string_literal: true
require 'date'

class Shift
  #
  # Supports
  #
  attr_accessor :id, :planning_id, :user_id,
                :start_date, :day_name,
                :commission
  #
  # Public class methods
  #
  def initialize(attrs = {})
    @id          = attrs.fetch('id', nil)
    @planning_id = attrs.fetch('planning_id', nil)
    @user_id     = attrs.fetch('user_id', nil)
    @start_date  = attrs.fetch('start_date', nil)
    @commission  = 0

    unless @start_date.nil?
      @day_name = Date.parse(@start_date)&.strftime("%A")&.downcase
    end
  end

  def self.interims(shifts, workers)
    interim_ids = Worker.interims(workers).map(&:id)

    shifts.select { |user_id, _shifts| interim_ids.include?(user_id) }
  end

  #
  # Public instance methods
  #

  #
  # Protected instance methods
  #
  # protected
end
