class Post < ActiveRecord::Base

	# validates_presence_of :title, :body
	# validates_uniqueness_of :title

	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true

end
