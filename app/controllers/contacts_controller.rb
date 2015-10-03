class ContactsController < ApplicationController
  def index
  end

  def upload
	redirect_to '/contacts/list'
  end

  def list
  end
end
