class UserPassword
 
  attr_accessor :driver
  
  # Locators
  USER_INFO = { class: "current-user-info" }
  CHANGE_PASSWORD_OPTION = { class: "pointer" }
  CURRENT_PASSWORD = { name: "current_password" }
  NEW_PASSWORD = { name: "password" }
  CONFIRM_PASSWORD = { name: "password_confirmation" }
  BUTTON = { class: "jisr-btn-azure" }
  
  def initialize(driver)
    self.driver = driver
  end
  
  def reach_to_menu
    driver.find_element(USER_INFO).click
    sleep(10)
    driver.find_elements(CHANGE_PASSWORD_OPTION)[3].click
  end
  
  def change_password(password,new_password)
    sleep(5)
    driver.find_element(CURRENT_PASSWORD).send_keys(password)
    driver.find_element(NEW_PASSWORD).send_keys(new_password)
    driver.find_element(CONFIRM_PASSWORD).send_keys(new_password)
    driver.find_elements(BUTTON)[2].click
    sleep(4)
  end
end