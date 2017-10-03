class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.references :user, foreign_key: true
      t.string :name_list
      t.string :content
      t.date :date

      t.timestamps
    end
  end
end
