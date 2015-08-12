class CreateState < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.references :country
      t.index [:country_id], unique: false
    end
  end
end
