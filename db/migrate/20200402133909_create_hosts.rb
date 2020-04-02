class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.string :hostname
      t.references :ip_addresses

      t.timestamps
    end
  end
end
