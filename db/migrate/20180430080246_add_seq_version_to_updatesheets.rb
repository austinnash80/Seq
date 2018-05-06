class AddSeqVersionToUpdatesheets < ActiveRecord::Migration[5.1]
  def change
    add_column :updatesheets, :seq_version, :string
    add_column :updatesheets, :hold, :boolean
  end
end
