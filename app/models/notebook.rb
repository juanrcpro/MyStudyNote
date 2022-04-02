class Notebook < ApplicationRecord
    has_rich_text :content
    belongs_to :user #Campo adiciomal un cuaderno le pertenece a un usuario
    #has_many :tasks
    
end
