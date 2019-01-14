# frozen_string_literal: true
require_relative 'worker'

class Medic < Worker
  #
  # Supports
  #

  #
  # Public class methods
  #

  #
  # Public instance methods
  #
  def medic?
    true
  end

  #
  # Protected instance methods
  #
  protected

  def paid
    270
  end
end
