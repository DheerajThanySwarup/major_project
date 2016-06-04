class AddAttachmentToPins < ActiveRecord::Migration
  def change
    add_column :pins, :attachment, :string
  end
end
