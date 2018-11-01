class Item < ApplicationRecord
  belongs_to :todo

  # validation
  validates :name, presence: true
end
