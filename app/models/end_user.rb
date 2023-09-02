class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, dependent: :destroy
  has_many :hospitals, through: :reservations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :telephone_number, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.last_name = "ゲスト"
      end_user.first_name = "ユーザー"
      end_user.last_name_kana = "ゲスト"
      end_user.first_name_kana = "ユーザー"
      end_user.birthday = '1993-01-01'
      end_user.sex = "男性"
      end_user.telephone_number = "09099999999"
      end_user.postal_code = "9999999"
      end_user.address = "東京都新宿区西新宿1丁目1-1"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

end
