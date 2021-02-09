class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def full_name
    self.last_name + " " + self.first_name
  end
  
   GRADE = {
    1 => "小3",
    2 => "小4",
    3 => "小5",
    4 => "小6",
    5 => "中1",
    6 => "中2",
    7 => "中3",
    8 => "高1",
    9 => "高2",
    10 => "高3"
  }
end
