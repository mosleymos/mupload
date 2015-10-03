require 'rails_helper'

describe "Test expect a homepage with about content" do
  feature "Test we should see a contact page" 
	scenario "Should see a contact page" do
	  visit '/'
		expect(page).to have_text('Mupload csv')
  end
end
