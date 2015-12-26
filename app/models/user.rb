# User Model
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable, authentication_keys: [:login]
  has_many :bookmarks, dependent: :destroy
  has_many :follows_from, class_name: Follow, foreign_key: :from_user_id, dependent: :destroy
  has_many :follows_to, class_name: Follow, foreign_key: :to_user_id, dependent: :destroy
  has_many :following, through: :follows_from, source: :to_user
  has_many :followed, through: :follows_to, source: :from_user
  validates :nickname, presence: true, uniqueness: true

  def self.find_for_facebook_oauth(auth)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless user
      user = User.new(name:     auth.extra.raw_info.name,
                      nickname: auth.extra.raw_info.name,
                      provider: auth.provider,
                      uid:      auth.uid,
                      email:    User.dummy_email(auth), # auth.info.email,
                      token:    auth.credentials.token,
                      password: Devise.friendly_token[0, 20])
      user.save
    end

    user
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login.nil?
      find_by(conditions)
    else
      where(conditions).find_by(['nickname= :value OR lower(email) = lower(:value)', { value: login }])
    end
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  def following?(user)
    following.where(id: user.id).any?
  end

  def followed_by?(user)
    followed.where(id: user.id).any?
  end
end
