class EnigmaTag < ActiveRecord::Migration
  def up
    create_table :enigmas_tags, :id => false do |t|
      t.integer :enigma_id
      t.integer :tag_id
    end
  end

  def down
    drop_table :enigmas_tags
  end
end
