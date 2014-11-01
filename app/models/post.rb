class Post < ActiveRecord::Base

	# validates_presence_of :title, :body
	# validates_uniqueness_of :title

	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true

  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end

end
