class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :number
      t.belongs_to :chat_application, index: true, foreign_key: true

      t.timestamps
    end
  end
end
