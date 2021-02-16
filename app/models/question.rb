class Question < ApplicationRecord
  belongs_to :student
  has_many :comments
  
  validates :content, presence: true
end
