class Message < ActiveRecord::Base
  before_save :fix_number

  def fix_number
    return false unless self.number
    number = self.number.gsub(/[^\d]/, '')
    unless number.length == 10
      errors.add(:phone_number, "must have 10 digits.")
    end  
  end  

end
