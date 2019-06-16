p 'Starting seed'

Result.destroy_all
Test.destroy_all
User.destroy_all
Project.destroy_all
Organization.destroy_all

p 'Models destroyed'

# Organizations

organization1 = Organization.create!(
  name: "Douglas, Berge and Hand Web Agency",
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
  email: "judson@ko.info",
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
  name: "Hermann and Sons",
  organization: organization1,
  ga_view_id: "148384019"
  )

project2 = Project.create!(
  name: "Swift-Block",
  organization: organization1,
  ga_view_id: "148384019"
  )

project3 = Project.create!(
  name: "Gerhold-Kirlin",
  organization: organization1,
  ga_view_id: "148384019"
  )

project4 = Project.create!(
  name: "Stiedemann and Sons",
  organization: organization1,
  ga_view_id: "148384019"
  )

# Tests

# ga_report_type: 'Event Category'
# ga_report_type: 'Event Action'
# ga_report_type: 'Event Label'
# ga_report_type: 'Custom Dimension'
# ga_report_type: 'Event action'
# ga_report_type: 'Channel grouping'

test1 = Test.create!(
  user: user1,
  project: project1,
  name: 'Event category quality',
  frequency: 'minute',
  ga_report_type: 'Event Category',
  event_category_regex:'Éditorial|Technique'
  )

test2 = Test.create!(
  user: user1,
  project: project1,
  name: 'Event category Edito or technique',
  frequency: 'minute',
  ga_report_type: 'Event Category',
  event_category_regex:'Pakito|Technique'
  )

test3 = Test.create!(
  user: user1,
  project: project1,
  name: 'Product brand quality',
  frequency: 'daily',
  ga_report_type: 'Event Action',
  event_action_regex: 'Youtube|Visibilité|CMP'
  )

test4 = Test.create!(
  user: user1,
  project: project2,
  name: 'Publication year',
  frequency: 'daily',
  ga_report_type: 'Custom Dimension',
  cd_index: 9,
  cd_regex: '2106|2017|2018|vide',
  cd_scope: 'ga:pageviews'
  )

test5 = Test.create!(
  user: user1,
  project: project2,
  name: 'Product ID',
  frequency: 'weekly',
  ga_report_type: 'EEC - Product ID',
  )

test5 = Test.create!(
  user: user1,
  project: project2,
  name: 'Publication year',
  frequency: 'daily',
  ga_report_type: 'EEC - Product Name',
  )

# Results

result1 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 631,
  number_incorrect_values: 12,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

result2 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 612,
  number_incorrect_values: 0,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

# result3 = Result.create!(
#   test: test1,
#   correct: false,
#   number_total_values: 632,
#   number_incorrect_values: 12,
#   top_incorrect_values: '{abcd,efgh,1234543322}'
#   )

# result4 = Result.create!(
#   test: test1,
#   correct: true,
#   number_total_values: 660,
#   number_incorrect_values: 4,
#   top_incorrect_values: '{abcd,efgh,1234543322}'
#   )

# result5 = Result.create!(
#   test: test1,
#   correct: true,
#   number_total_values: 631,
#   number_incorrect_values: 15,
#   top_incorrect_values: '{abcd,efgh,1234543322}'
#   )

# result6 = Result.create!(
#   test: test1,
#   correct: false,
#   number_total_values: 631,
#   number_incorrect_values: 22,
#   top_incorrect_values: '{abcd,efgh,1234543322}'
#   )

# result7 = Result.create!(
#   test: test1,
#   correct: true,
#   number_total_values: 500,
#   number_incorrect_values: 15,
#   top_incorrect_values: '{abcd,efgh,1234543322}'
#   )

# result8 = Result.create!(
#   test: test1,
#   correct: true,
#   number_total_values: 645,
#   number_incorrect_values: 2,
#   top_incorrect_values: '{abcd,efgh,1234543322}'
#   )

# result9 = Result.create!(
#   test: test1,
#   correct: true,
#   number_total_values: 514,
#   number_incorrect_values: 0,
#   top_incorrect_values: '{abcd,efgh,1234543322}'
#   )

p 'End of seed'
