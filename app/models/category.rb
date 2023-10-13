class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 10 }
  validates_uniqueness_of :name
  
  has_many :article_categories
  has_many :articles, through: :article_categories
end
