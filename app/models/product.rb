class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, :description, :price, presence: true
  validates :price, format: { with: /\A[0-9]*\.?[0-9]{0,2}\z/ }

  def average_rating
    reviews.average(:rating)
  end
end
