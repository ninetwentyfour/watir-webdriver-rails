module WatirWebdriverRails
  class << self
    attr_accessor :browser,:browser_initialized
    
    def initialize_browser
      
      return if @browser_initialized == true

      @headless = Headless.new
      @headless.start
      @browser = Watir::Browser.new
      #@browser = Watir::Browser.new(WatirWebdriverRails.use_browser ||= :ff)
      
      @browser.class_eval do
         alias_method :old_goto,:goto
         
         def goto(*args)
           
           if !args[0].match(/^https?:/)
              args[0] = "http://#{WatirWebdriverRails.host}:#{WatirWebdriverRails.port}#{args[0]}"
           end
           
           old_goto(*args)      
         end
      end
      
      @browser_initialized = true
    end
    
    def close_browser
      @browser.close if @browser_initialized == true
      @browser_initialized = false
      @headless.destroy
    end
     
  end
end
