class AddImagesToTemplatesAndActors < ActiveRecord::Migration[5.2]
  def change
    add_attachment :templates, :image
    add_attachment :actors, :image
  end
end
