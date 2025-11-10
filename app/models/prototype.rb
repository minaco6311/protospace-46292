class Prototype < ApplicationRecord
  # アソシエーション（関連付け）
  belongs_to :user
  has_many :comments, dependent: :destroy

  # ActiveStorageによる画像アップロード機能
  has_one_attached :image

  # バリデーション（入力チェック）
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
