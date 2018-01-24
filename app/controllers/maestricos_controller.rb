class MaestricosController < ApplicationController
	before_action :load_data, :only => [:prueba, :index]
	$titulo_base = "titulo"
	$tabla_base = "tabla"
	def index	
		if(flash[:titulo])
			@titulo = flash[:titulo]
			@tabla = flash[:tabla].classify.constantize
			$titulo_base = @titulo
			$tabla_base = @tabla
		else
			@titulo = $titulo_base
			@tabla = $tabla_base
		end
		@tabla_new = @tabla.new
		@maestricos = @tabla.all
	end

	def new
   
  end

	def edit
		@tabla = params[:tabla].classify.constantize
		@objecto = @tabla.find(params[:tabla_id])
		render "/maestricos/edit"
	end
	
	def prueba
		redirect_to maestricos_path, flash: {titulo: @titulo, tabla: @tabla}
	end

	private

  def load_data
  	@titulo = params[:titulo]
  	@tabla = params[:tabla]
  end
end