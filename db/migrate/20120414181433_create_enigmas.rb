class CreateEnigmas < ActiveRecord::Migration
  def change
    create_table :enigmas do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :short_solution
      t.text :long_solution

      t.timestamps
    end
  end
end
