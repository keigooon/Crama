class Student < ApplicationRecord
  
  has_many :lessons
  has_many :teachers, through: :lessons
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  before_save { self.email.downcase! }
  validates :first_name, presence: true, length: { maximum: 5 }
  validates :last_name, presence: true, length: { maximum: 5 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :grade, inclusion: 1..10
   
  
  def gakunen_grade
    number_grade = {
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
    number_grade[self.grade]
  end
end
