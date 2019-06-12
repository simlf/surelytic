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

  def new
    @test = Test.new
  end

  def create
    project = current_user.projects.find(params[:project_id])
    @test = Test.new(test_params)
    @test.project = project
    @test.user = current_user

    @test.save
    redirect_to project_path(project)
  end

  private

  def test_params
    params.require(:test).permit(
      :name,
      :frequency,
      :ga_report_type,
      :cd_index,
      :cd_regex,
      :cd_scope,
      :eec_product_name_regex,
      :eec_product_id_regex,
      :eec_product_category_regex,
      :eec_product_brand_regex,
      :event_category_regex,
      :event_action_regex,
      :event_label_regex,
      :goal_index
    )
  end
end
