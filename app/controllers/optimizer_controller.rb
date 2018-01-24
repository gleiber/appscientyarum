class OptimizerController < ApplicationController

def index
    @role_funcion = RoleFuncion.new
    @roles = Role.all
    @funcions = Funcion.all
	
end

def show
	
end


end