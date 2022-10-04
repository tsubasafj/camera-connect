class Board < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :want
  belongs_to :prefecture

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
    validates :want_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
  end
end
