class CreateSections < ActiveRecord::Migration
  def change
  	create_table :sections do |t|
  		t.string :section_name
  		t.integer :teacher_id
  		t.integer :student_id
  		t.string :class_name

  		t.timestamps null: false
  end
end
