class Task < ApplicationRecord
   
    belongs_to :user

    has_many :task_x_categories
    #indicar la relacion de muchos a muchos a traves de la tabla con ayuda de through
    has_many :categories, through: :task_x_categories
    #definir propiedad que puedo leer y escribir
    attr_accessor :category_elements

    def save_categories
        #entrada "1,2,3" separado por comas to_s
        #categories_elements comvertir en array  [1,2,3]
        #categories_array = category_elements.split(",")

        # retornar los valores si no hay que iterar, conserva lo que tenia 
        return task_x_categories.destroy_all if (category_elements.nil? || category_elements.empty?)
        

        #inverso devuelve los elementos que no coincidan 
        task_x_categories.where.not(category_id: category_elements).destroy_all
        
        #iterar array
        category_elements.each do |category_id|
            #si hay algun registro que cumpla las condiciones lo return  si no lo crea
           #Por cada elemento en el arreglo crear registro en task_x_categories
        
        #si la condicion devuelve true uno o mas no lo crea, si devuelve falso sin valor lo crea 
        #if askXCategory.where(task:self, category_id: category_id).any?
        #else
            #TaskXCategory.create(task: self, category_id: category_id)
        #end
        
        #A menos de que la condicion se cumpla en falso se ejecuta 
        unless TaskXCategory.where(task:self, category_id: category_id).any?
            TaskXCategory.create(task: self, category_id: category_id)
        end


        #si hay un registro lo retorna si no lo crea 
        #TaskXCategory.find_or_create_by(task: self,category_id: category_id)

        

            


        end
    end
end
