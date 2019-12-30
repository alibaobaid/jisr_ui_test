class UsersPower
  
  attr_accessor :driver
  
  # Locators
  CARDS = { class: "col-xl-4" }
  TITLE = { class: "title"}
  APPROVED = { class: "approval-details" }
  FILTER_BUTTON = { class: "filter-button" }
  APPROVED_FILTER = { name: "approved" }  
  CANCEL_BUTTON = { class: "close-icon" }

  def initialize(driver)
    self.driver = driver
  end
  
  def customer_cards
    driver.find_elements(CARDS).each { |card| 
      return false unless (card.text.include?("Leo Messi") || card.find_element(APPROVED).text == "APPROVED")
    }

    return true
  end

  def super_admin_cards
    driver.find_elements(CARDS).each { |card|
      return false unless (card.text.include?("Othman Mokhtar Mohammed") || card.find_element(APPROVED).text == "APPROVED" || card.find_element(APPROVED).text != "APPROVED" )
    }
    
    return true 
  end

  def cancellation_button 
    driver.find_element(FILTER_BUTTON).click
    sleep(2)
    
    driver.find_element(APPROVED_FILTER).click
    sleep(2)
    
    driver.find_element(class: "buttons").find_element(class: "jisr-btn-azure").click
    sleep(15)
    
    driver.find_elements(CARDS).each { |card|
      card.find_element(CANCEL_BUTTON) unless card.text.include?("إلغاء") || card.text.include?("cancellation")
    }

    return true 
  rescue StandardError => e
    return false
  end
end