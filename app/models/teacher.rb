class Teacher < ActiveRecord::Base
	has_many :sections
  has_many :students, through: :sections
  has_many :posts
end
