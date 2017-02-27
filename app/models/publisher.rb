class Publisher < ActiveRecord::Base
  has_many :albums
  has_many :songs, through: :albums

  validates :name, length: { in: 5..50 }, uniqueness: true
  validates :address, length: { in: 5..50 }
  validates :city, length: { in: 5..50 }
  validates :state, length: { is: 2 }
  validates :zip, format: { with: /\A\d{5}\z/, message: "should be five digits" }
  validates :phone, format: { with: /\A\d{3}-\d{3}-\d{4}\z/, message: "should look like 210-555-1234" }
  validates :url, format: { with: /\Ahttp:\/\/.+\z/, message: "should look like http://www.yahoo.com" }

  def publisher_record
    "#{name} - #{city} - #{state}"
  end

end