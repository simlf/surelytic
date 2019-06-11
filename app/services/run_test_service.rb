class RunTestService
  def initialize(test)
    @test = test
  end

  def call
    @test = Test.find('blabla')

    # gestion de la date
    # si test frequency = daily ==> start date = end date = yesterday
    # si test weekly = start date ...
    # si test monthly

    # si test type =

    service = Google::Apis::AnalyticsreportingV4::AnalyticsReportingService.new
    # Create service account credentials
    credentials = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(Rails.root.join('service_account_cred.json')),
      scope: 'https://www.googleapis.com/auth/analytics.readonly'
    )
    service.authorization = credentials
    google_client = service
    # Set the date range - this is always required for report requests
    date_range = Google::Apis::AnalyticsreportingV4::DateRange.new(
      start_date: '2019-06-01', end_date: '2019-06-10'
    )
    # Set the metric
    metric = Google::Apis::AnalyticsreportingV4::Metric.new(
      expression: 'ga:users'
    )
    # Set the dimension
    dimension = Google::Apis::AnalyticsreportingV4::Dimension.new(
      name: 'ga:browser'
    )
    # Build report request and add country filter
    report_request = Google::Apis::AnalyticsreportingV4::ReportRequest.new(
      view_id: '196537952',
      sampling_level: 'DEFAULT',
      filters_expression: 'ga:country==France',
      date_ranges: [date_range],
      metrics: [metric],
      dimensions: [dimension]
    )

    # New report request
    request = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new({
      report_requests: [report_request]
    })

    # API call
    response = google_client.batch_get_reports(request)
  end
end

# rails c
# test = Test.first
# RunTestService.new(test).call

# view part
#     <h1>API request</h1>
# <% ga_api_results = @response.reports[0].data.rows %>
# <% ga_api_results.each do |row| %>
#  <p> <%= row.dimensions[0] %> | <%= row.metrics[0].values[0]  %>  </p>
# <% end %>
