class User < ApplicationRecord
  # Deviseによるユーザー認証機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション（関連付け）
  has_many :prototypes, dependent: :destroy
  has_many :comments, dependent: :destroy


  # バリデーション（入力チェック）
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
end
