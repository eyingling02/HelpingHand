class CreateStudents < ActiveRecord::Migration
  def change
  	create_table :students do |t|
  		t.string :first_name
  		t.string :last_name
  		t.text :notes
  		t.integer :risk_level
  		t.string :emotional_analysis
  		t.integer :section_id

  		t.timestamps null: false
  	end
  end
end
