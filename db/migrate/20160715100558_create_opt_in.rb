class CreateOptIn < ActiveRecord::Migration
  def up
    create_table :opt_ins do |t|
      t.string :email
      t.string :mobile
      t.string :first_name
      t.string :last_name
      t.string :permission_type
      t.string :channel
      t.string :company_name
    end
  end
  def down
    drop_table :opt_ins
  end
end