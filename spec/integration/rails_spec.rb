require 'spec_helper'

describe "Rails startup process" do
  it "should fill textbox" do
    browser.goto "/"
    #use with media queries :)- 
    #browser.window.resize_to(640, 960)
    browser.text_field(:id=>"test_textbox").set("Hello")
    browser.text_field(:id=>"test_textbox").value.should == "Hello"
  end
end