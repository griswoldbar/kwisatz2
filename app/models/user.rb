class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :players
  has_many :questions, :class_name => "Question::Base", :foreign_key => :creator_id
  has_many :quizzes, :class_name => "Quiz::Base", :foreign_key => :creator_id
  has_many :rounds, :class_name => "Round::Base", :foreign_key => :creator_id
  has_many :categories, :foreign_key => :creator_id
  
end
