# frozen_string_literal: true
require_relative 'worker'

class Interim < Worker
  #
  # Supports
  #

  #
  # Public class methods
  #

  #
  # Public instance methods
  #
  def interim?
    true
  end

  #
  # Protected instance methods
  #
  protected

  def paid
    480
  end
end
