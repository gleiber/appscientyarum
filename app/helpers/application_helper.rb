module ApplicationHelper
    def is_active_controller(controller_name, class_name = nil)
        if params[:controller] == controller_name
         class_name == nil ? "active" : class_name
        else
           nil
        end
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end
    def flass_class(type)
        case type
        when :success then "success"
        when :error then "warning"
        when :alert then "warning"
        when :notice then ""
        else "info"
            
        end
        
    end
    
end
