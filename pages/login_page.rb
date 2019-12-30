class Login

  attr_accessor :driver

  # Locators
  USER_NAME = { name: "login" }
  PASSWORD = { name: "password" }
  BUTTON = { class: "btn" }

  def initialize(driver)
    self.driver = driver
  end

  def enter_name(name)
    driver.find_element(USER_NAME).send_keys(name)
  end

  def enter_password(password)
    driver.find_element(PASSWORD).send_keys(password)
  end

  def click_submit
      driver.find_element(BUTTON).click
  end
   
end
