class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def full_name
    self.last_name + " " + self.first_name
  end
end
