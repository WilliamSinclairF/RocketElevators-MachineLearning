class AddAudioFileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :greeting_message, :string
  end
end
