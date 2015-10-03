require 'rails_helper'

describe "Test expect a homepage with about content" do
  feature "Test we should see a contact page" 
	scenario "Should see a contact page" do
	  visit '/'
		expect(page).to have_text('Mupload csv')
		expect(page).to have_button('Envoi')
  end
end

describe "Test expect send a csv file" do

  feature "Test we should see a list of contacts"
  scenario "Should see a list of contacts" do
    visit '/'
    attach_file("contacts", "#{Rails.root + 'contacter.xlsx'}")
		click_button("Envoi")
		expect(page).to have_text("Liste des contacts")
  end

end
