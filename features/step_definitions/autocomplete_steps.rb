When /^I typeahead in "(.*)" with "(.*)"$/ do |field, value|
  field = field_labeled field
  @typeahead = AutoCompleteStepsHelper.new(request)
  @typeahead.type(field, value)
end

When /^I fill in "(.*)" with the first typeahead result$/ do |field|
  result = @typeahead.current_dom.at('//ul/li').inner_html
  When %Q[I fill in "#{field}" with "#{result}"]
end

When /^I typeahead in "(.*)" with "(.*)" selecting the first result$/ do |field, value|
  When %Q{I typeahead in "#{field}" with "#{value}"}
  When %Q{I fill in "#{field}" with the first typeahead result}
end

Then /^I should see in my typeahead "(.*)"$/ do |text|
  @typeahead.response_body.should =~ /#{text}/m
end

Then /^I should not see in my typeahead "(.*)"$/ do |text|
  @typeahead.response_body.should_not =~ /#{text}/m
end
