class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id])
    @before_last_result, @last_result = @test.results.order(:created_at).last(2)

    # si on a que 1 result, il se retouve en before last alors on le remet en last
    unless @last_result
      @last_result        = @before_last_result
      @before_last_result = nil
    end
  end
end
