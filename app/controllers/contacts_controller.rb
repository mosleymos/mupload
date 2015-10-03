require 'pry'
require 'roo'
class ContactsController < ApplicationController
  def index
  end

  def upload
    uploaded = params[:contacts]
    @import = []
    xlsx = Roo::Spreadsheet.open(uploaded.original_filename)
    xlsx.each_with_pagename do |name, sheet|
      ((sheet.first_row+1).upto(sheet.last_row).map{|r| @import << (xlsx.sheet(name).row(r)[0].capitalize + " " + xlsx.sheet(name).row(r)[1].upcase + " " + xlsx.sheet(name).row(r)[2]) })
    end

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
