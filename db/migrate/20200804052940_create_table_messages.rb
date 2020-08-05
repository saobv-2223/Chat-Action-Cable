class CreateTableMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.bigint :sender_id
      t.bigint :receiver_id
      t.foreign_key :users, column: :sender_id, primary_key: "id"
      t.foreign_key :users, column: :receiver_id, primary_key: "id"
    end
  end
end
