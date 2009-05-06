Given /^"([^\"]*)" is a user living at "([^\"]*)"$/ do |user_name, address|
  User.create!(:name=>user_name, :address=>address)
end
