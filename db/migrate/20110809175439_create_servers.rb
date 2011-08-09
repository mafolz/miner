class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :title
      t.string :path
      t.string :map_path

      t.timestamps
    end
  end
end
