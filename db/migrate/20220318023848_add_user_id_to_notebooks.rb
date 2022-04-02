#ails g migration add_user_id_to_notebooks user:references addicionar columna a tabla en este caso una referencia

class AddUserIdToNotebooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :notebooks, :user, null: false, foreign_key: true
    #Ex:- :default =>''
  end
end
