p 'Starting seed'

Result.destroy_all
Test.destroy_all
User.destroy_all
Project.destroy_all
Organization.destroy_all

p 'Models destroyed'

# Organizations

organization1 = Organization.create!(
  name: "Surelytics Consulting Agency Corp",
  ga_account_service_id: '1234@gmail.com',
  current_credits: 12,
  monthly_credits: 30
  )

organization2 = Organization.create!(
  name: "Rohan-Jaskolski",
  ga_account_service_id: '090909@gmail.com',
  current_credits: 8,
  monthly_credits: 40
  )

organization3 = Organization.create!(
  name: "Corwin-Adams",
  ga_account_service_id: 'abcd@gmail.com',
  current_credits: 5,
  monthly_credits: 10
  )

organization4 = Organization.create!(
  name: "Beer and Sons",
  ga_account_service_id: '00000@gmail.com',
  current_credits: 10,
  monthly_credits: 100
  )

# Users

user1 = User.create!(
  organization: organization1,
  email: "aristide@surelytics.tech",
  role: 'admin',
  password: 'secret'
  )

user2 = User.create!(
  organization: organization1,
  email: "adeladurgan@blandaeffertz.org",
  role: 'user',
  password: 'secret'
  )

user3 = User.create!(
  organization: organization1,
  email: "devonabashirian@kutch.com",
  role: 'admin',
  password: 'secret'
  )

user4 = User.create!(
  organization: organization1,
  email: "rogeliodickens@wuckert.biz",
  role: 'user',
  password: 'secret'
  )

# Projects

project1 = Project.create!(
  name: "Acme Corporation",
  organization: organization1,
  ga_view_id: "148384019"
  )

project2 = Project.create!(
  name: "Globex Corporation",
  organization: organization1,
  ga_view_id: "148384019"
  )

project3 = Project.create!(
  name: "Umbrella Corporation",
  organization: organization1,
  ga_view_id: "148384019"
  )

project4 = Project.create!(
  name: "Hooli",
  organization: organization1,
  ga_view_id: "148384019"
  )

# Tests

test1 = Test.create!(
  user: user1,
  project: project1,
  name: '🚀Event category check',
  frequency: 'daily',
  ga_report_type: 'Event Category',
  event_category_regex:'Éditorial|Technique'
  )

test2 = Test.create!(
  user: user1,
  project: project1,
  name: 'Event Category Menu or AB Testing',
  frequency: 'weekly',
  ga_report_type: 'Event Category',
  event_category_regex:'Menu|ABtest'
  )

test3 = Test.create!(
  user: user1,
  project: project3,
  name: 'Product brand quality',
  frequency: 'weekly',
  ga_report_type: 'Event Action',
  event_action_regex: 'Youtube|Visibilité|CMP'
  )

test4 = Test.create!(
  user: user1,
  project: project4,
  name: 'Product brand quality',
  frequency: 'weekly',
  ga_report_type: 'Event Action',
  event_action_regex: 'Top|Bottom|Footer'
  )

test5 = Test.create!(
  user: user1,
  project: project1,
  name: 'Product brand quality',
  frequency: 'weekly',
  ga_report_type: 'Event Action',
  event_action_regex: 'Active|Inactive|null'
  )

test6 = Test.create!(
  user: user1,
  project: project2,
  name: 'Publication year',
  frequency: 'weekly',
  ga_report_type: 'Custom Dimension',
  cd_index: 9,
  cd_regex: '2106|2017|2018|vide',
  cd_scope: 'ga:pageviews'
  )

test7 = Test.create!(
  user: user1,
  project: project4,
  name: 'Client category',
  frequency: 'weekly',
  ga_report_type: 'Custom Dimension',
  cd_index: 6,
  cd_regex: 'client|prospect|unknown',
  cd_scope: 'ga:pageviews'
  )

test8 = Test.create!(
  user: user1,
  project: project1,
  name: 'Shipping method',
  frequency: 'weekly',
  ga_report_type: 'Custom Dimension',
  cd_index: 3,
  cd_regex: 'quick|slow',
  cd_scope: 'ga:pageviews'
  )

test9 = Test.create!(
  user: user1,
  project: project2,
  name: 'Product Name',
  frequency: 'weekly',
  ga_report_type: 'EEC - Product Name',
  eec_product_id_regex: '{0-9}[5]'
  )

test10 = Test.create!(
  user: user1,
  project: project3,
  name: 'Product Name',
  frequency: 'weekly',
  ga_report_type: 'EEC - Product Name',
  eec_product_id_regex: 'Shoes|Shirts'
  )

test11 = Test.create!(
  user: user1,
  project: project4,
  name: 'Product Name',
  frequency: 'weekly',
  ga_report_type: 'EEC - Product Name',
  eec_product_id_regex: 'abcd'
  )

# Results

result1 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 631,
  number_incorrect_values: 12
  )

result2 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 612,
  number_incorrect_values: 0
  )

result3 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 598,
  number_incorrect_values: 4
  )

result4 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 662,
  number_incorrect_values: 18
  )

result5 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 640,
  number_incorrect_values: 8
  )

result6 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 617,
  number_incorrect_values: 2
  )

result7 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 640,
  number_incorrect_values: 1
  )

p 'End of seed'
