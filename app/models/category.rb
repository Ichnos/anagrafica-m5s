class Category < ActiveRecord::Base
  has_many :article_categories
  has_many :articles, through: :article_categories
  validates :name, presence: true,
             uniqueness: { case_sensitive: false }, # > validates_uniqueness_of :name   ||  è la stessa cosa
             length: { minimum: 3, maximum: 25 }
end