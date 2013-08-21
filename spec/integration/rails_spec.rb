require 'spec_helper'

describe "Rails startup process" do
  it "should fill textbox" do
    browser.goto "/"
    #use with media queries :)- 
    #browser.window.resize_to(640, 960)
    browser.text_field(:id=>"test_textbox").set("Hello")
    browser.text_field(:id=>"test_textbox").value.should == "Hello"
    #screenshot_file = "app/assets/images/failed/screenshot-#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
    # for rails app save screenshot files in images/failed with time-date-name.png
    #browser.screenshot.save(screenshot_file)

    # also dont forget to create a dir named 'failed' and add a .gitignore to ignore eveything in that dir exept the .gitignore :)-
  end
end