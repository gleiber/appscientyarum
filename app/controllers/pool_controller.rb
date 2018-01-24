class PoolController < ApplicationController


	def index
     
     @users = User.all 
     @users_roles = User.all.find_by role_id: "1"
	 @line_investigations = LineInvestigation.all


   	end


	end
