Organization.destroy_all
User.destroy_all
Test.destroy_all
Result.destroy_all
Project.destroy_all

organization1 = Organization.create!(name: 'Marknet', ga_account_service_id: '1234@gmail.com', current_credits: 20, monthly_credits: 30)

user1 = User.create!(organization: organization1, email: 'chloe.dupont@gmail.com', role: 'admin')

project1 = Project.create!(name: 'Cybery', organization: organization1)

test1 = Test.create!(
  user: user1,
  project: project1,
  name: 'Products ID EEC',
  frequency: 'monthly',
  ga_report_type: 'enhanced e-commerce',
  # ga_link: '????,'
  cd_index:
  cd_regex:
  cd_scope:
  eec_product_name_regex:
  eec_product_id_regex:'[0-9]{6}'
  eec_product_category_regex:
  eec_product_brand_regex:
  event_category_regex:
  event_action_regex:
  event_label_regex:
  goal_index:
  )

result1 = Result.create!(
  test: test1,
  run_date: 1560198489131,
  correct: false,
  number_total_values: 631,
  number_incorrect_values: 12,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

