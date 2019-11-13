class CreateCustomerReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_reviews do |t|
      t.text :body
      t.string :customer_name
      t.references :admin_user, foreign_key: true
      t.attachment :image

      t.timestamps
    end
  end
end
