Organization.destroy_all
User.destroy_all
Test.destroy_all
Result.destroy_all
Project.destroy_all

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
  role: 'admin')

user2 = User.create!(
  organization: organization1,
  email: "adeladurgan@blandaeffertz.org",
  role: 'user')

user3 = User.create!(
  organization: organization1,
  email: "devonabashirian@kutch.com",
  role: 'admin')

user4 = User.create!(
  organization: organization1,
  email: "rogeliodickens@wuckert.biz",
  role: 'user')

# Projects

project1 = Project.create!(
  name: "Hermann and Sons",
  organization: organization1
  )

project2 = Project.create!(
  name: "Swift-Block",
  organization: organization1
  )

project3 = Project.create!(
  name: "Gerhold-Kirlin",
  organization: organization1
  )

project4 = Project.create!(
  name: "Stiedemann and Sons",
  organization: organization1
  )

# Tests

test1 = Test.create!(
  user: user1,
  project: project1,
  name: 'Products ID',
  frequency: 'monthly',
  ga_report_type: 'enhanced e-commerce',
  eec_product_id_regex:'[0-9]{6}'
  )

test2 = Test.create!(
  user: user1,
  project: project1,
  name: 'Products name control',
  frequency: 'daily',
  ga_report_type: 'enhanced e-commerce',
  eec_product_category_regex: 'Shoes|Bags'
  )

test3 = Test.create!(
  user: user1,
  project: project1,
  name: 'Product brand quality',
  frequency: 'weekly',
  ga_report_type: 'enhanced e-commerce',
  eec_product_brand_regex: 'adidas|converse'
  )

test4 = Test.create!(
  user: user1,
  project: project1,
  name: 'User ID',
  frequency: 'monthly',
  ga_report_type: 'custom dimension',
  cd_index: 5,
  cd_regex: '[0-9]{9}',
  cd_scope: 'user'
  )

test5 = Test.create!(
  user: user1,
  project: project1,
  name: 'Product arbo',
  frequency: 'daily',
  ga_report_type: 'custom dimension',
  cd_index: 3,
  cd_regex: '.*/.*',
  cd_scope: 'hit'
  )

test6 = Test.create!(
  user: user1,
  project: project1,
  name: 'adblocker',
  frequency: 'daily',
  ga_report_type: 'custom dimension',
  cd_index: 7,
  cd_regex: 'enabled|disabled',
  cd_scope: 'session'
  )

test7 = Test.create!(
  user: user1,
  project: project1,
  name: 'event category consistency',
  frequency: 'monthly',
  ga_report_type: 'event',
  event_category_regex: 'browsing|ecommerce|menu',
  event_action_regex:
  event_label_regex:
  )

test8 = Test.create!(
  user: user1,
  project: project1,
  name: 'Menu clicks',
  frequency: 'daily',
  ga_report_type: 'event',
  event_category_regex: 'menu',
  event_action_regex: 'header|footer'
  )

test9 = Test.create!(
  user: user1,
  project: project1,
  name: 'Form validation',
  frequency: 'monthly',
  ga_report_type: 'event',
  event_category_regex: 'form contact',
  event_label_regex: 'signin|signup'
  )

test10 = Test.create!(
  user: user1,
  project: project1,
  name: 'Newsletter subscription',
  frequency: 'monthly',
  ga_report_type: 'goals',
  goal_index: 1
  )

test11 = Test.create!(
  user: user1,
  project: project1,
  name: 'Lead submitted',
  frequency: 'weekly',
  ga_report_type: 'goals',
  goal_index: 3
  )

test11 = Test.create!(
  user: user1,
  project: project1,
  name: 'Add to wishlist',
  frequency: 'weekly',
  ga_report_type: 'goals',
  goal_index: 7
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
  number_total_values: 1000,
  number_incorrect_values: 12,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

result3 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 983,
  number_incorrect_values: 12,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

result4 = Result.create!(
  test: test1,
  correct: true,
  number_total_values: 612,
  number_incorrect_values: 4,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

result5 = Result.create!(
  test: test1,
  correct: true,
  number_total_values: 1215,
  number_incorrect_values: 1215,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

result6 = Result.create!(
  test: test1,
  correct: false,
  number_total_values: 631,
  number_incorrect_values: 0,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

result7 = Result.create!(
  test: test1,
  correct: true,
  number_total_values: 390,
  number_incorrect_values: 0,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

result8 = Result.create!(
  test: test1,
  correct: true,
  number_total_values: 210,
  number_incorrect_values: 204,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )

result9 = Result.create!(
  test: test1,
  correct: true,
  number_total_values: 514,
  number_incorrect_values: 0,
  top_incorrect_values: '{abcd,efgh,1234543322}'
  )
