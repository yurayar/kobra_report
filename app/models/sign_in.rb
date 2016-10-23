class SignIn < ApplicationRecord
  belongs_to :officer
  before_save :set_ip

  def set_ip
    self.sign_in_ip = Officer.find(self.officer.id).current_sign_in_ip.to_s
  end
end
