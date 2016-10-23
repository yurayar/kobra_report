class SignIn < ApplicationRecord
  belongs_to :officer
  before_save :set_attr

  def set_attr
    @officer = Officer.find_by(:name => self.sign_in_officer)
    self.officer_id = @officer.id
    self.sign_in_ip = @officer.current_sign_in_ip
  end
end
