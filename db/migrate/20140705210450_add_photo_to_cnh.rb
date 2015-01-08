class AddPhotoToCnh < ActiveRecord::Migration
  def change
    add_reference :cnhs, :photo, index: true
  end
end
