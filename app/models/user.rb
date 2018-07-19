class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :validatable
  has_many :address_bills, inverse_of: :user
  has_many :bills, through: :address_bills
  has_many :comments
  accepts_nested_attributes_for :address_bills
  mount_uploader :avatar, PictureUploader

  ADMIN = 1
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.max_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.min_password},
    allow_nil: true
  before_save :downcase_email

  def self.load_email_from_bill bill
    joins(:bills).where("bills.id = ?", bill.id).pluck("users.email")
  end

  private
  def downcase_email
    email.downcase!
  end
end
