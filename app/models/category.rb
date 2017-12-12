class Category <ApplicationRecord
  validates_presence_of :title, uniqueness: true
  has_many :jobs 

end
