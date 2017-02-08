class Officer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  has_many :reports
  has_many :sign_ins

  after_save :create_sign_in, if: :sign_in_count_changed?

  def create_sign_in
    SignIn.create(:sign_in_at => DateTime.now, :sign_in_officer => self.name)
  end

  def active_for_authentication?
    super && self.is_active
  end

  def is_active
    return self.officer_active
  end

  def deactivate_officer
    self.update_attribute(:officer_active, false)
  end

  def activate_officer
    self.update_attribute(:officer_active, true)
  end

  def inactive_message
    "Sorry, this account has been deactivated."
  end
end
