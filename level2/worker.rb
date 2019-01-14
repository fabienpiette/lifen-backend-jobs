# frozen_string_literal: true

class Worker
  #
  # Supports
  #
  attr_accessor :id, :first_name, :status

  #
  # Public class methods
  #
  def initialize(attrs = {}, shifts = {})
    @id         = attrs.fetch('id', nil)
    @first_name = attrs.fetch('first_name', nil)
    @status     = attrs.fetch('status', nil)
    @shifts     = shifts.select { |s| s['user_id'] == @id }
  end

  def self.build(attrs = {}, shifts = {})
    case attrs['status']
    when 'medic'
      Medic.new(attrs, shifts)
    when 'interne'
      Intern.new(attrs, shifts)
    else
      raise ArgumentError, "You must provide a valid status."
    end
  end

  #
  # Public instance methods
  #
  def price
    paid * @shifts.length
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
