class ImportParticipantsController < ApplicationController

def index
	    @programs = Program.all
	    @users = User.all
        @users_roles = User.all.find_by role_id: "3"
	
end



end