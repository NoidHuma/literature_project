class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  validates :title, presence: true
  validates :publication_date, presence: true
end
