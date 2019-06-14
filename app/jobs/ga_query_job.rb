require 'sidekiq-scheduler'

class GaQueryJob < ApplicationJob
  queue_as :default

  def perform
    # test ID as param
    # find test
    # call service
    test = Test.first
    # test = test6.9
    RunTestService.new(test).call
  end
end
