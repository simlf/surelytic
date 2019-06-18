class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id])

    if @test.results.size >= 1
      @last_result = @test.results.last
      @before_last_result = @test.results[-2] if @test.results.size >= 2
    end

    @chart_data_labels = []
    @chart_data_correct = []
    @chart_data_incorrect = []

    @test.results.last(5).each do |result|
      @chart_data_correct.push(result.number_total_values)
      @chart_data_incorrect.push(-result.number_incorrect_values)
      @chart_data_labels.push(result.updated_at.strftime("%m/%d/%Y"))
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

  def edit
    @project = current_user.projects.find(params[:project_id])
    @test = @project.tests.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:project_id])
    @test = Test.find(params[:id])
    @test.update(test_params)

    redirect_to project_path(@project)
  end

  def destroy
    @project = current_user.projects.find(params[:project_id])
    @test = @project.tests.find(params[:id])
    @test.destroy

    redirect_to project_path(@project)
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
