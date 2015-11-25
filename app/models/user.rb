class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  has_many :bookmarks, dependent: :destroy
  validates :nickname, presence: true, uniqueness: true

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login.nil?
      where(conditions).first
    else
      where(conditions).where(["nickname= :value OR lower(email) = lower(:value)", { :value => login }]).first
    end
  end
end
