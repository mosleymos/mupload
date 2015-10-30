require 'rails_helper'

RSpec.describe "static/index.html.erb", type: :view do
  it "should display a homepage" do
    render.include?("Accueil")
  end
end
