class Car < ApplicationRecord
  has_many :reports
  mount_uploader :car_photo, CarPhotoUploader
end
