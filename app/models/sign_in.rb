class SignIn < ApplicationRecord
  belongs_to :officer
  before_save :set_attr

  def set_attr
    self.officer_id = current_officer.id
    self.sign_in_ip = Officer.find(self.officer.id).current_sign_in_ip.to_s
  end
end
