module Capybara
  module Selenium
    Driver.class_eval do

      def browser_with_resize
        browser_was_uninitialized = @browser.nil?
        browser_without_resize
        # If the browser window was just opened, we resize it:
        execute_script("window.resizeTo(1024, screen.height)") if browser_was_uninitialized
        @browser
      end

      alias_method_chain :browser, :resize

    end
  end
end