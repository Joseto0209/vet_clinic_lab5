class Vet < ApplicationRecord
  has_many :appointments

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :specialization, presence: true

  # Scopes
  scope :by_specialization, ->(specialization) { where(specialization: specialization) }

  # Callbacks - normalize email before validation
  before_validation :normalize_email

  private

  def normalize_email
    self.email = email.strip.downcase if email.present?
  end
end