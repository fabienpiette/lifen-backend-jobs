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
    @datas   = attrs
    @workers = []
    @shifts  = {}
    @output  = {
      workers: [],
      commission: {
        pdg_fee: nil,
        interim_shifts: nil
      }
    }
  end

  #
  # Public instance methods
  #
  def run
    # Build shifts
    @datas['shifts'].each do |data_shift|
      @shifts[data_shift['user_id']] ||= []
      @shifts[data_shift['user_id']] << Shift.new(data_shift)
    end

    # Build workers
    @workers = @datas['workers'].map do |data_worker|
      Worker.build(data_worker.merge(shifts: @shifts[data_worker['id']]))
    end

    # Calculate price for each workers.
    @output[:workers] = @workers.map do |worker|
      worker.output
    end

    # Calculate commissions
    commission = Commission.new(@workers)
    @output[:commission][:interim_shifts] = commission.interim_shifts
    @output[:commission][:pdg_fee]        = commission.pdg_fee
  end

  def export
    File.open('output.json', 'w') { |f| f << JSON.pretty_generate(@output) }
  end

  #
  # Protected instance methods
  #
  # protected
end
