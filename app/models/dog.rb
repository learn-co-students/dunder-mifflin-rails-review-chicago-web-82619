class Dog < ApplicationRecord
  validates :name, :breed, :age, presence: true
  has_many :employees
end
