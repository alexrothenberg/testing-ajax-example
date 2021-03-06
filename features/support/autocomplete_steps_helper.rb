class AutoCompleteStepsHelper < ActionController::IntegrationTest
  def initialize(existing_request)
    @controller_name = existing_request.parameters[:controller]
    @controller_class = "#{@controller_name.to_s.camelize}Controller".constantize
    raise "Can't determine controller class for #{@controller_class_name}" if @controller_class.nil?

    @controller = @controller_class.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    @request.session = existing_request.session

    # # make the following specific for your application if you implement security
    # # login as some user that can make ajax calls
    # user = User.first
    # visit login_url(:username=>user.name, :password=>user.password)
  end
  
  def type(field, value)
    visit url_for(:controller=>@controller_name, :action=>"auto_complete_for_#{field.id}", field.send(:name)=>value)
  end
  
  def items
    current_dom.search('//ul/li').map(&:inner_html)
  end
end