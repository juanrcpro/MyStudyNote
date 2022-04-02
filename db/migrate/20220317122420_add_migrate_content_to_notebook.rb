class AddMigrateContentToNotebook < ActiveRecord::Migration[7.0]
  def change
    add_reference :action_text_rich_texts, :notebook, index:true
  end
end
