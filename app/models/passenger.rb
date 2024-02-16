class Passenger < ApplicationRecord
  # Add any other fields you need
  validates_uniqueness_of :email, if: -> { email.present? }
  before_validation :strip_whitespace
  attr_accessor :otp
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :driver
  has_many :rides
  has_many :drivers, through: :rides

  private

  def strip_whitespace
    self.email = email.strip if email.present?
  end
end
