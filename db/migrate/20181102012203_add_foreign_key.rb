class AddForeignKey < ActiveRecord::Migration[5.1]
  def change

        add_foreign_key :mylistings, :users
  end
end
