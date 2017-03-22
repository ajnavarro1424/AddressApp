class AddPaperclipToApartments < ActiveRecord::Migration
  def change
    add_attachment :apartments, :image #add this line
  end
end
