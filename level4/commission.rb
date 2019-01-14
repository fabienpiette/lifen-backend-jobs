# frozen_string_literal: true

class Commission
  #
  # Supports
  #
  attr_accessor :workers

  #
  # Public class methods
  #
  def initialize(workers)
    @workers = workers
  end

  #
  # Public instance methods
  #
  def interim_shifts
    Worker.interims(@workers).map(&:shifts).flatten.length
  end

  def pdg_fee
    interim_shifts * 80 + @workers.sum(&:commission)
  end

  #
  # Protected instance methods
  #
  # protected
end
