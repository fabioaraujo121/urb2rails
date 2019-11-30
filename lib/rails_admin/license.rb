class RailsAdmin::Config::Actions::License < RailsAdmin::Config::Actions::Base
    RailsAdmin::Config::Actions.register(self)

    register_instance_option :http_methods do
          [:get] # NEW
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
                # Generar PDF com os dados necessários
                # https://onebitcode.com/como-criar-pdfs-incrives-usando-ruby-prawn-gruff/
                @kind_steps = @object.kind.kind_steps
                render @action.template_name, status: 200
            end
        end
    end

    register_instance_option :route_fragment do
        'license'
    end

    register_instance_option :link_icon do
        'icon-file'
    end

    register_instance_option :visible? do
        subject = bindings[:object]
        subject.is_a? Demand
    end
end