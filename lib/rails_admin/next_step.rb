class RailsAdmin::Config::Actions::NextStep < RailsAdmin::Config::Actions::Base
    RailsAdmin::Config::Actions.register(self)

    register_instance_option :http_methods do
          [:get, :post] # NEW / CREATE
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
                # Rendering the page
                @kind_steps = @object.kind.kind_steps
                render @action.template_name, status: 200
            elsif request.post?
                @step = Step.new(demand: @object, kind_step_id: params[:step].to_i, user: current_user)
                if @step.save!
                    @auditing_adapter && @auditing_adapter.create_object(@object, @abstract_model, _current_user)
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
        'next-step'
    end

    register_instance_option :link_icon do
        'icon-arrow-right'
    end

    register_instance_option :visible? do
        subject = bindings[:object]
        subject.is_a? Demand
    end
end