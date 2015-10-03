class ContactsController < ApplicationController
	class Contact
	  attr_accessor :firstname, :lastname, :email, :status
		def initialize(firstname, lastname, email)
			@firstname= firstname
			@lastname = lastname
			@email = email
			@status = false
		end

		def email_valid?
			regex_email=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
		  (@email =~ regex_email) == 0
		end

		def correct_contact
		  regex = /[^a-zA-Z\d\s:]/
			@firstname = @firstname.gsub(regex, '').capitalize
			@lastname = @lastname.gsub(regex, '').capitalize
			return self
		end
		
		def identity_valid?
		  @firstname.length > 3 && @lastname.length > 3
		end 

		def contact_valid?
			if identity_valid? && email_valid?
        @status = true
			else
				@status = false
			end
		end

		def to_a
		  [@firstname,@lastname,@email]
		end

		def to_s
		  "#{@firstname} #{@lastname} #{@email}"
		end
	end

  def index
  end

  def upload
    uploaded = params[:contacts]
    @import, @good, @bad = [], [], []
    xlsx = Roo::Spreadsheet.open(uploaded.original_filename)
    xlsx.each_with_pagename do |name, sheet|
      ((sheet.first_row+1).upto(sheet.last_row)).map do|r|
         @import.push(Contact.new(xlsx.sheet(name).row(r)[0], xlsx.sheet(name).row(r)[1], xlsx.sheet(name).row(r)[2])
)			end
    end
		@bad = @import.map{|e| e}.select{|f| f.correct_contact.contact_valid? == false }
		@good = @import.map{|e| e}.select{|f| f.correct_contact.contact_valid? == true }

		flash[:bad] = @bad
		flash[:good] = @good 
    redirect_to '/contacts/list'

  end

  def list
  end

  private

  def contacts_params
    params.permit(:good, :bad)
  end

end
