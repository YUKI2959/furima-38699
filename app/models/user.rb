class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # passwordは半角英数字混合での入力でないと登録できない
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # presence: true 空を許可しない
  validates :birthday, presence: true
  validates :nickname, presence: true

  # presence: true 空を許可しない
  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :last_name, :first_name, presence: true,
                                       format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
    # カタカナのみ許可する
    validates :last_name_kana, :first_name_kana, presence: true,
                                                 format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  end

  # Association
  has_many :items
  has_many :orders
end
