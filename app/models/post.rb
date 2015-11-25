class Post < ActiveRecord::Base
	
	validates :title, presence: true
	validates :body, presence: true

	validates :title, length: { minimum: 5 }
	validates :body, length: { minimum: 8 }

	has_many :comments 

end
