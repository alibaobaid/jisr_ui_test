
require "selenium-webdriver"
require "rspec"
require_relative "pages/login_page.rb"
require_relative "pages/change_password.rb" 
require_relative "pages/users_power.rb"

# Data   
customer_name = "" # enter user name here
customer_password = "" # enter password
super_admin_name = "" # enter user name here
super_admin_password = "" # enter password
jisr_url = "" #enter jisr hr url

# Rspec Configuration  
RSpec.configure do |config|

  config.before(:all) do
    @driver = Selenium::WebDriver.for(:chrome)
    navigate_to(jisr_url)
  end

  config.after(:all) do |example|
    @driver.quit
  end
 
end

# Methods
def navigate_to(url)
  @driver.get(url)
  sleep(5)
rescue StandardError => e
end

def login_to_jisr(name, password)
  sleep(10)
  login = Login.new(@driver)
  login.enter_name(name)
  login.enter_password(password)
  login.click_submit
  sleep(15)
rescue StandardError => e
end

def change_password(password, new_password)
  user = UserPassword.new(@driver)
  user.reach_to_menu
  user.change_password(password, new_password)
  return true
rescue StandardError => e
  return false
end

def check_customer_cards  
  UsersPower.new(@driver).customer_cards
  return true
rescue StandardError => e
  return false
end

# Selenium and Rspec test cases 
describe "jisr test cases" do

  it 'navigate to jisr' do
    expect(@driver.title).to eql("Jisr")
  end

  describe "session test cases" do
    
    xit 'login with invalid values'  do
      login_to_jisr("25542", "othman221")
      expect(@driver.page_source).to_not include("Othman Mokhtar Mohammed")
    end

    it 'login with super admin valid values'  do
      login_to_jisr(super_admin_name, super_admin_password)
      expect(@driver.page_source).to include("Othman Mokhtar Mohammed")
    end

    it 'change super admin  password' do
      sleep(5) 
      expect(change_password(super_admin_password, super_admin_password)).to eql(true)
    end

    xit 'login with customer valid credentials'  do
      login_to_jisr(customer_name, customer_password)
      expect(@driver.page_source).to include("Leo Messi")
    end

  end
  
  describe "users power test cases" do

    xit 'customer should be able to see all cards belong to him' do
      expect(UsersPower.new(@driver).customer_cards).to eql(true)  
    end
    
    xit 'customer not be able to see share announcement button in overview page' do
      sleep(3)
      expect(@driver.page_source).to_not include("Share Announcement")
    end

    it 'super admin should be able to see share announcement button in overview page' do
      sleep(5)
      expect(@driver.page_source).to include("Share Announcement")
    end

    it 'super admin should be able to see all requests in Overview page , which non-super admin or HR admin should not be able to see ' do
      expect(UsersPower.new(@driver).super_admin_cards).to eql(true) 
    end

    it 'super admin should be able to see Cancel button (X) for every approved requests except cancellation' do 
      expect(UsersPower.new(@driver).cancellation_button).to eql(true)
    end

  end
end
