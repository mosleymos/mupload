require 'rails_helper'

describe ContactsController do
		it "should respond to the index" do
			get :index
			expect(response).to render_template('index')
		end
end
