class AddPhotoToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :car_photo, :string
  end
end
