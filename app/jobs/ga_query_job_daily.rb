require 'sidekiq-scheduler'

class GaQueryJobDaily < ApplicationJob
  queue_as :default

  def perform
    tests = Test.where(frequency: "daily")
    tests.each do |test|
      RunTestService.new(test).call
    end
  end
end
