class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :tracking_number
      t.string :carrier
      t.float :length
      t.float :width
      t.float :height
      t.float :weight
      t.float :package_total_weight
      t.integer :package_label_weight
      t.string :distance_unit
      t.string :mass_unit
      t.float :fedex_total_weight
      t.float :overweight

      t.timestamps
    end
  end
end
