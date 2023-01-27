class AddConfirmationFieldsToUsers < ActiveRecord::Migration[7.0]
  change_table :users do |t|
    t.datetime :confirmend_at
    t.string :confirmation_token
  end
end
