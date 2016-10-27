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

end
