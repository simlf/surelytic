module TestsHelper
  def diff_between_results(result, previous_result)
    (result.number_total_values - previous_result.number_total_values).abs
  end

  def percentage_between_results(result, previous_result)
    (diff_between_results(result, previous_result).to_f / previous_result.number_total_values * 100).round(0)
  end
end
