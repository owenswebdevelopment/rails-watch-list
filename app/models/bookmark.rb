class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  validates :comment, presence: true
  validates :list, presence: true
  validates :movie, presence: true
  validates :movie_id, uniqueness: { scope: :list } #means that one movie to one list, can have more than oneS
end
