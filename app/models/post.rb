class Post < ActiveRecord::Base

  # one-to-many relationship with comments
	has_many :comments, dependent: :destroy

  # creation validations
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true

  # friendlyID integration
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end

  # acts_as_taggable_on integration
  acts_as_taggable_on :tags

  # next/prev
  scope :next, lambda {|id| where("id > ?",id).order("id ASC") }
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
    Post.next(self.id).first
  end

  def previous
    Post.previous(self.id).first
  end

end
