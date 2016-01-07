class StaticController < ApplicationController
  swagger_controller :static, "Static pages"

  swagger_api :index do
    summary "Show the main page"
    response :ok, "Success"
  end

  def index
  end

  swagger_api :about do
    summary "Show the about page"
    response :ok, "Success"
  end

  def about
  end
end
