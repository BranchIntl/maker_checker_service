class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.timestamps

      t.string :username, null: false, index: { unique: true }
      t.jsonb :metadata
    end
  end
end
