class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :number
      t.text :body
      t.belongs_to :chat, index: true, foreign_key: true

      t.timestamps
    end
  end
end
