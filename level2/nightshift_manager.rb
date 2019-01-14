# frozen_string_literal: true

class NightshiftManager
  #
  # Supports
  #
  attr_accessor :workers, :shifts, :datas, :output

  #
  # Public class methods
  #
  def initialize(attrs = {})
    @datas = attrs
    @output = {
      workers: []
    }
  end

  #
  # Public instance methods
  #
  def run
    @shifts  = @datas['shifts']
    @workers = @datas['workers'].map do |data_worker|
      Worker.build(data_worker, @shifts)
    end

    @output[:workers] = @workers.map do |worker|
      worker.output
    end
  end

  def export
    File.open('output.json', 'w') { |f| f << JSON.pretty_generate(@output) }
  end

  #
  # Protected instance methods
  #
  # protected
end
