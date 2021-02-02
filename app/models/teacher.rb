class Teacher < ApplicationRecord
  has_many :lessons
  has_many :students, through: :lessons
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  #validates       
  before_save { self.email.downcase! }
  validates :first_name, presence: true, length: { maximum: 5 }
  validates :last_name, presence: true, length: { maximum: 5 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :course, inclusion: { in: ["文系","理系"] }
end
