class ContactsController < ApplicationController
  def index
  end

  def upload
    uploaded = params[:contacts]
		regex = /[^a-zA-Z\d\s:]/
		regex_email=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    @import = []
    xlsx = Roo::Spreadsheet.open(uploaded.original_filename)
    xlsx.each_with_pagename do |name, sheet|
      ((sheet.first_row+1).upto(sheet.last_row)).map do|r|
        @import << [xlsx.sheet(name).row(r)[0].capitalize, xlsx.sheet(name).row(r)[1].capitalize,  xlsx.sheet(name).row(r)[2]]
			end
    end
		@import = @import.map{|e| e }.reject{|f| ((f[0].size < 3 or f[1].size <3))or(!regex_email.match(f[2]))}

		@import.each{|e| e[0] =  e[0].gsub(regex,'')}
		@import.each{|e| e[1] =  e[1].gsub(regex,'')}
    flash[:import_csv] = @import
    redirect_to '/contacts/list'

  end

  def list
  end

  private

  def contacts_params
    params.permit(:import_csv)
  end

end
