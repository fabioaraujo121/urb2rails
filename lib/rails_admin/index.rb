class RailsAdmin::Config::Actions::Index < RailsAdmin::Config::Actions::Base
    RailsAdmin::Config::Actions.register(self)

   	register_instance_option :controller do
        proc do
        	if @model_name == "Demand"
        		if current_user.admin?
        			@objects ||= list_entries
        		else
        			@objects = Demand.where("current_kind_step_id IN (?)", current_user.kind_step_users.map(&:kind_step_id))
        		end
        	else
        		@objects ||= list_entries
        	end
        end
    end
end