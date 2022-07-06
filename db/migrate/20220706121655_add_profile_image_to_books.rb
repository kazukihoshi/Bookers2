class AddProfileImageToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :profile_image, :integer
  end
end
