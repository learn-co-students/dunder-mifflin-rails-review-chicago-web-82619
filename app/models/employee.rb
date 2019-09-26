class Employee < ApplicationRecord
    belongs_to :dog
    validates(:title, {uniqueness: true})
    validates(:alias, {uniqueness: true})
end
