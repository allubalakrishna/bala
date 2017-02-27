class Album < ActiveRecord::Base
  belongs_to :publisher, required: true
  has_many :songs
  scope :latest, -> {order(created_at: :desc)}
  scope :recent, -> (n) {where(created_at: 6.months.ago..Time.now).limit(n)}

  validates :name, presence: true, length: { in: 2..50 }
  validates :cover_art, presence: true
  validates :released_on, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "should be in the format YYYY-MM-DD" }
end
