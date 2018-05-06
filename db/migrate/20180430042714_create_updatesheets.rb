class CreateUpdatesheets < ActiveRecord::Migration[5.1]
  def change
    create_table :updatesheets do |t|
      t.integer :pes_number
      t.string :pes_version
      t.date :date_received
      t.boolean :update_course
      t.boolean :new_course
      t.text :note_approval
      t.boolean :text_complete
      t.boolean :exam_complete
      t.boolean :course_listed
      t.date :date_listed
      t.string :role
      t.string :rolep
      t.string :irs_number
      t.boolean :proofed
      t.text :proofed_note
      t.integer :datasheet_id

      t.timestamps
    end
  end
end
