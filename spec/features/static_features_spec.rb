require 'rails_helper'

describe 'Test a homepage for the site' do
  feature 'Test visit root site'
  scenario 'should display the correct information about the service' do
    visit '/'
    expect(page).to have_text('Mupload csv')
    expect(page).to have_text('Accueil')
  end
end

describe 'Test a homepage for the site' do
  feature 'Test visit root site'
  scenario 'should display the correct information about the service' do
    visit '/about'
    expect(page).to have_text('Mupload csv')
    expect(page).to have_text('A propos')
  end
end
