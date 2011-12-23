class CreateRoundItems < ActiveRecord::Migration
  def self.up
    create_table :round_items do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :round_items
  end
end
