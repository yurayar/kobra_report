class Officer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reports

  def after_database_authentication
      SignIn.create(:sign_in_at => DateTime.now, :sign_in_ip => self.current_sign_in_ip.to_s, :sign_in_officer => self.name)
  end
end
