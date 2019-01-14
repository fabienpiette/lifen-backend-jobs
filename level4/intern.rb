# frozen_string_literal: true
require_relative 'worker'

class Intern < Worker
  #
  # Supports
  #

  #
  # Public class methods
  #

  #
  # Public instance methods
  #
  def intern?
    true
  end

  #
  # Protected instance methods
  #
  protected

  def paid
    126
  end
end
