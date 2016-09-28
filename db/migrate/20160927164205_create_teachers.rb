class CreateTeachers < ActiveRecord::Migration
  def change
  	create_table :teachers do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :school
  		t.text :bio
  		t.string :email
  		t.string :password_hash

  		t.timestamps null: false
  	end
  end
end
