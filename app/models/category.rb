class Category < ActiveRecord::Base
  validates :name, presence: true,
             uniqueness: { case_sensitive: false }, # > validates_uniqueness_of :name   ||  è la stessa cosa
             length: { minimum: 3, maximum: 25 }
end