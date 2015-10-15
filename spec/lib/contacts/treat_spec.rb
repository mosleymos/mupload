require 'rails_helper'

describe Treat do
  let(:contact){Treat::Contact.new('dev le testeur', 'testeur', 'devtest@gmail.com' )}
  let(:bad_contact){Treat::Contact.new('mo', 'zi', 'tbgmail.com' )}
  it'should include Contact' do
    expect(Treat::Contact.present?).to eq true
  end
  it 'A new contact with correct input should respond to his attributes' do
    expect(contact.firstname).to eq 'dev le testeur'
    expect(contact.lastname).to eq  'testeur'
    expect(contact.email).to eq 'devtest@gmail.com'
    expect(contact.status).to eq false
  end
  it 'A new contact with correct input should have a email_valid?' do
    expect(contact.email_valid?).to eq true
  end
	it '#correct_contact should correct the firstname' do
		contact.correct_contact
    expect(contact.firstname).to eq 'Dev le testeur'
  end
	it '#identity_valid?' do
    expect(contact.identity_valid?).to eq true
    expect(bad_contact.identity_valid?).to eq false
  end
	it '#contact_valid?' do
    expect(contact.contact_valid?).to eq true
    expect(bad_contact.contact_valid?).to eq false
	end
end
