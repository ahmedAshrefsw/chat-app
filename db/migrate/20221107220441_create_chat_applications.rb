class CreateChatApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_applications do |t|
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
