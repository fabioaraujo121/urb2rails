class RailsAdmin::Config::Actions::Done < RailsAdmin::Config::Actions::Base
    RailsAdmin::Config::Actions.register(self)

    register_instance_option :http_methods do
        [:get]
    end

    register_instance_option :member do
        true
    end

    register_instance_option :breadcrumb_parent do
        [:show, bindings[:abstract_model], bindings[:object]]
    end

    register_instance_option :controller do
        proc do
            if request.get?
                if @object.update(done_at: DateTime.current, status: Demand.statuses[:done])
                    respond_to do |format|
                        format.html { redirect_to_on_success }
                        format.js   { render json: {id: @object.id.to_s, label: @model_config.with(object: @object).object_label} }
                    end
                else
                    handle_save_error                    
                end
            end
        end
    end

    register_instance_option :route_fragment do
        'done'
    end

    register_instance_option :link_icon do
        'icon-check'
    end

    register_instance_option :visible? do
        subject = bindings[:object]
        subject.is_a? Demand
    end
end