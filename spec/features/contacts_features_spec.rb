require 'rails_helper'

describe 'Test expect a homepage with about content' do
  feature 'Test we should see a contact page' 
  scenario "Should see a contact page" do
    visit '/'
    expect(page).to have_text('Mupload csv')
    expect(page).to have_button('Envoi')
  end
end
describe 'Test expect send a excel file' do
  feature 'Test we should see a list of contacts'
  scenario 'Should see a list of contacts' do
    visit '/'
    attach_file('contacts', "#{Rails.root + 'contacter.xlsx'}")
    click_button('Envoi')
    expect(page).to have_text('Liste des contacts')
  end
end
describe 'Test expect good list from excel file' do
  feature 'Test we should see a list of good contacts'
  scenario 'Should see a list of clean contacts' do
    visit '/'
    attach_file('contacts', "#{Rails.root + 'contacter.xlsx'}")
    click_button('Envoi')
    expect(page).to have_text('Paul')
    expect(page).to have_text('Durant')
    expect(page).to have_text('p.durant@gmail.com')
  end
end
describe 'Test expect a list with no repeated contacts' do
  feature 'Test we should see a list unique contacts'
  scenario 'Should see a list of unique contacts' do
    visit '/'
    attach_file('contacts', "#{Rails.root + 'contacter.xlsx'}")
    click_button('Envoi')
    expect(page).to have_text('Paul')
    expect(page).to have_text('Durant')
    expect(page).to have_text('p.durant@gmail.com')
    expect(page).to have_text('Mori')
    expect(page).to have_text("Keita")

  end
end
describe 'Test expect to show unindentified contacts from excel file' do
  feature 'Test we should see a list of bad contacts too'
  scenario 'Should see a list of bad contacts' do
    visit '/'
    attach_file('contacts', "#{Rails.root + 'contacter.xlsx'}")
    click_button('Envoi')
    expect(page).to have_text('Paul')
    expect(page).to have_text('Durant')
    expect(page).to have_text('p.durant@gmail.com')
    expect(page).to have_text('Contacts non identifiés')
    expect(page).to have_text('Fl')
    expect(page).to have_text('Bd')
    expect(page).to have_text('n=martin@t§sd.fr')
  end
end
