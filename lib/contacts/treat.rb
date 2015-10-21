module Treat 
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
      regex = /[^a-zA-Zïëöéèàîôç\d\s:]/
      @firstname = @firstname.gsub(regex, '').capitalize
      @lastname = @lastname.gsub(regex, '').capitalize
      return self
    end
		
    def identity_valid?
      @firstname.length > 3 && @lastname.length > 3
    end 

    def contact_valid?
      identity_valid? && email_valid? ? @status = true : @status = false
    end
  end
end
