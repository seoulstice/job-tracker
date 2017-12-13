class Category < ApplicationRecord
  has_many :jobs
  validates :title, presence: true, uniqueness: true
end
