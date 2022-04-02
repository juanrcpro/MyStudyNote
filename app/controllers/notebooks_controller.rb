class NotebooksController < ApplicationController
    #before_action = todos los metodos que deben ser ejecutados antes de cualquier otro de esta clase 
    #after_action = todos los metodos que deben ser ejecutados despues de cualquier otro de esta clase 
    #CRUD = CREAR, LEER, ACTUALIZAR Y ELIMINAR
    #llamamos el mtodo y con only indicamos en cuales aplicara las que no esten no seran tomadas en cuenta
    before_action :find_notebook, except: [:new, :create, :index, :from_owner, :notebook_params]
    before_action :authenticate_user!, only: [:create, :edit, :new, :update, :show, :destory]
    #before_action :find_notebook, except: [:new,:create]


    def from_owner
        @user = User.find(params[:user_id])
        

    end

    def index 
        #todos los objetos, cuadernos
        @notebooks = Notebook.all
    end

    def find_notebook
        @notebook = Notebook.find(params[:id])
    end

    #Carga el registro segun el ID que se recibe por get declarado en routes
    def show
        #@notebook = Notebook.find(params[:id])
    end

    #Carga el registro segun el ID que se recibe por get declarado en routes
    def edit
        #@notebook = Notebook.find(params[:id])
    end

    #Metodo de la clase que recibe por parametros las columnas del registro con ayuda de params
    def create
        #Por comvencion puede ser llamado el objeto notebook para crear uno nuevo
        #@notebook = current_user.notebooks.create(title: params[:notebook][:title], description: params[:notebook][:description], content: params[:notebook][:content])
        #Parametros en general del objeto hash completo
        @notebook = current_user.notebooks.create(notebook_params)
        
        #redirecciona despues de la ejecucion
        redirect_to @notebook
    end

    #Metodo del objeto que recibe por parametroslos las columnas del registro con ayuda de params
    def update
        #@notebook = Notebook.find(params[:id])
        #@notebook.update(title: params[:notebook][:title], description: params[:notebook][:description], content: params[:notebook][:content])
        @notebook.update(notebook_params )
        redirect_to @notebook

    end

    #Carga el registro a partir de la solicitud de la url del id
    def destroy
        @notebook = Notebook.find(params[:id])
        @notebook.destroy
        redirect_to root_path
    end

    #Metodo de la clase para la generacion de nuevo objeto
    def new
        @notebook = Notebook.new
    end
    
    #parametros fuertes restringir injeccion sql
    def notebook_params
        params.require(:notebook).permit(:title,:description,:content)
    end
    
    
end
