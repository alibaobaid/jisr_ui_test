# Jisr End to End test with selenium
> this projact is create to ensure UI test for jisr hr using selenium tool with Rspec using Ruby

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Status](#status)
* [Notes](#notes)
* [Contact](#contact)

## General info
> this project build to help QA team to ensure all UI test case without using the manually test 
  so that can help them to save time and cover more test  cases in less time  


## Technologies
* selenium-webdriver - version 3.141
* rspec - version 3.8

## Setup
* you should include this gems in your Gemfile file `gem 'rspec', '~> 3.8'` and `gem 'selenium-webdriver', '~> 3.141'`
* run bundle install in your terminal in the same path of the project  `bundle install`
* download the Chrome Driver depend on your chrome browser version from this link  [@chromedriver](http://chromedriver.chromium.org/downloads)
* add chrome driver current path to system PATH so that can be recognized 
* Now you should be able to run jisr_ui_test.rb file by using one of this commands
  * `rspec jisr_ui_test.rb` you must be in the same path of the file 
  * `rspec -fh jisr_ui_test.rb > test_report.html` To generate a test report (HTML) after test execution 

## Status
Project is: _in progress_,

## Notes
* make sure to install the last version of chrome browser and his driver 
* to avoid any test case put x before the (it) rspec keyword

## Contact
Created by [@Ali Amrah](https://www.facebook.com/ALIB555) - feel free to contact me!