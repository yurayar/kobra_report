class AddDetailsToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :call_num, :integer
    add_column :cars, :mileage, :integer
    add_column :cars, :car_base, :string
  end
end
