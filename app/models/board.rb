class Board < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes

  def self.search(search)
    if search != ""
      Board.where('information LIKE(?)', "%#{search}%")
    else
      Board.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :title, :information, :genre, presence: true
  with_options numericality: { other_than: 1 } do
    validates :genre_id
  end
end
