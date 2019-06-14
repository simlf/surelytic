require 'sidekiq-scheduler'

class GaQueryJob < ApplicationJob
  queue_as :default

  def perform
    # test ID as param
    # find test
    # call service
    # test = Test.second
    # test = test7
    RunTestService.new.call
  end
end
