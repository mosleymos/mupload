require 'rails_helper'

RSpec.describe "errors/not_found.html.erb", type: :view do
  it "should display a 404 page" do
    render.include?("404")
  end
end
