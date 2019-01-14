# frozen_string_literal: true

class Worker
  #
  # Supports
  #
  attr_accessor :id, :first_name, :status, :shifts

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
    when 'interim'
      Interim.new(attrs)
    else
      raise ArgumentError, "You must provide a valid status."
    end
  end

  def self.interims(workers)
    workers.select{ |w| w.interim? }
  end

  #
  # Public instance methods
  #
  def total_shifts_price
    (paid * 2 * @weekend_shifts.length) + (paid * @week_shifts.length)
  end

  def output
    {
      id: @id,
      price: total_shifts_price
    }
  end

  def interim?
    false
  end

  def intern?
    false
  end

  def medic?
    false
  end

  def commission
    total_shifts_price * 0.05
  end

  #
  # Protected instance methods
  #
  protected

  def paid
    raise NotImplementedError
  end
end
