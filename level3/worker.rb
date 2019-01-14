# frozen_string_literal: true

class Worker
  #
  # Supports
  #
  attr_accessor :id, :first_name, :status

  #
  # Public class methods
  #
  def initialize(attrs = {})
    @id         = attrs.fetch('id', nil)
    @first_name = attrs.fetch('first_name', nil)
    @status     = attrs.fetch('status', nil)
    @shifts     = attrs.fetch(:shifts, [])

    @weekend_shifts = @shifts.select do |shift|
      shift.day_name == 'saturday' || shift.day_name == 'sunday'
    end
    @week_shifts = @shifts - @weekend_shifts
  end

  def self.build(attrs = {})
    case attrs['status']
    when 'medic'
      Medic.new(attrs)
    when 'interne'
      Intern.new(attrs)
    else
      raise ArgumentError, "You must provide a valid status."
    end
  end

  #
  # Public instance methods
  #
  def price
    (paid * 2 * @weekend_shifts.length) + (paid * @week_shifts.length)
  end

  def output
    {
      id: @id,
      price: price
    }
  end

  #
  # Protected instance methods
  #
  # protected
end
