class ContactsController < ApplicationController
	
	include Treat
	
  def index
  end

  def upload
		begin
		create_contact = Treat::Contact
    uploaded = params[:contacts]
    @import, @good, @bad = [], [], []
    xlsx = Roo::Spreadsheet.open(uploaded.original_filename)
    xlsx.each_with_pagename do |name, sheet|
      ((sheet.first_row+1).upto(sheet.last_row)).map do|r|
         @import.push(create_contact.new(xlsx.sheet(name).row(r)[0], xlsx.sheet(name).row(r)[1], xlsx.sheet(name).row(r)[2]))
      end
    end

    @import = @import.uniq { |e| [e.firstname, e.lastname, e.email] }
    @bad = @import.map { |e| e }.select { |f| f.correct_contact.contact_valid? == false }
    @good = @import.map { |e| e }.select { |f| f.correct_contact.contact_valid? == true }
    
    flash[:bad] = @bad
    flash[:good] = @good 
    redirect_to '/contacts/list'

		rescue
			redirect_to '/server_error'
		end

  end

  def list
  end

  private

  def contacts_params
    params.permit(:good, :bad, :contacts)
  end

end
