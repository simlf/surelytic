require 'sidekiq-scheduler'

class GaQueryJobMinute < ApplicationJob
  queue_as :default

  def perform
    tests = Test.where(frequency: "minute")
    tests.each do |test|
      RunTestService.new(test).call
    end
  end
end

class GaQueryJobDaily < ApplicationJob
  queue_as :default

  def perform
    tests = Test.where(frequency: "daily")
    tests.each do |test|
      RunTestService.new(test).call
    end
  end
end
