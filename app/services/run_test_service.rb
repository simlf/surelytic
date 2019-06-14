require 'google/apis/analyticsreporting_v4'
# require 'googleauth'

class RunTestService
  # def initialize(test)
  #   @test = test
  # end

  def initialize
  end

  def call
    p "cron call"

    organization5 = Organization.create!(
      name: "cron",
      ga_account_service_id: 'DDD@gmail.com',
      current_credits: 10,
      monthly_credits: 100
    )

    # default values
    # api_start_date = 'yesterday'
    # api_end_date = 'yesterday'
    # api_metric = 'ga:pageviews'
    # api_dimension = 'ga:dimension15'
    # api_condition_regex = ''
    # api_view_id = @test.project.ga_view_id

    # if @test.frequency == 'weekly'
    #   api_start_date = '7daysAgo'
    # elsif @test.frequency == 'monthly'
    #   api_start_date = '30daysAgo'
    # end

    # if @test.ga_report_type == 'custom dimension'
    #   api_metric = @test.cd_scope
    #   api_dimension = "ga:dimension#{@test.cd_index}"
    #   api_condition_regex = "ga:dimension#{@test.cd_index}=~#{@test.cd_regex}"

    # elsif @test.ga_report_type == 'event'
    #   api_metric = 'ga:totalEvents'
    #   api_dimension = 'ga:eventCategory'
    #   api_condition_regex = "ga:eventCategory=~#{@test.event_category_regex}"

    # elsif @test.ga_report_type == 'enhanced e-commerce'
    #   api_metric = 'ga:transactions'
    #   api_dimension = 'ga:productName'
    #   api_condition_regex = "ga:productName=~#{@test.eec_product_name_regex}"

    # elsif @test.ga_report_type == 'goals'
    #   api_metric = "ga:goal#{@test.goal_index}completions"
    # end

    # service = Google::Apis::AnalyticsreportingV4::AnalyticsReportingService.new
    # credentials = Google::Auth::ServiceAccountCredentials.make_creds(
    #   json_key_io: File.open(Rails.root.join('service_account_cred.json')),
    #   scope: 'https://www.googleapis.com/auth/analytics.readonly'
    # )
    # service.authorization = credentials
    # google_client = service

    # date_range = Google::Apis::AnalyticsreportingV4::DateRange.new(
    #   start_date: api_start_date, end_date: api_end_date
    # )
    # metric = Google::Apis::AnalyticsreportingV4::Metric.new(
    #   expression: api_metric
    # )
    # dimension = Google::Apis::AnalyticsreportingV4::Dimension.new(
    #   name: api_dimension
    # )

    # report_request = Google::Apis::AnalyticsreportingV4::ReportRequest.new(
    #   view_id: api_view_id,
    #   sampling_level: 'DEFAULT',
    #   date_ranges: [date_range],
    #   metrics: [metric],
    #   dimensions: [dimension]
    # )

    # report_request_with_regex = Google::Apis::AnalyticsreportingV4::ReportRequest.new(
    #   view_id: api_view_id,
    #   sampling_level: 'DEFAULT',
    #   filters_expression: api_condition_regex,
    #   date_ranges: [date_range],
    #   metrics: [metric],
    #   dimensions: [dimension]
    # )

    # # New report request
    # request = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new({
    #   report_requests: [report_request]
    # })
    # request_with_regex = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new({
    #   report_requests: [report_request_with_regex]
    # })

    # response = google_client.batch_get_reports(request)
    # response_with_regex = google_client.batch_get_reports(request_with_regex)

    # total_values = response.reports[0].data.totals[0].values[0].to_i
    # correct_values = response_with_regex.reports[0].data.totals[0].values[0].to_i

    # @result = Result.new
    # @result.number_total_values = total_values
    # @result.number_incorrect_values = total_values - correct_values
    # @result.test = @test
    # @result.save
  end
end

# rails c
# test = Test.second
# RunTestService.new(test).call
