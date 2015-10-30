require 'rails_helper'

RSpec.describe "static/about.html.erb", type: :view do
  it "should display a legal mentions page" do
    render.include?("A propos")
	end
end
