class RailsAdmin::Config::Actions::Dashboard < RailsAdmin::Config::Actions::Base
    RailsAdmin::Config::Actions.register(self)

    register_instance_option :root? do
        true
    end

    register_instance_option :breadcrumb_parent do
        nil
    end

    register_instance_option :controller do
        proc do
            @real_duration = Demand.all.includes(steps: :kind_step).map do |demand|
                demand_hours = 0.0
                demand.steps.order(created_at: :asc).each_with_index do |step, i|
                    next if !step.kind_step.valid_time
                    if i == demand.steps.length - 1 && i == 0 && !demand.stopped?
                        demand_hours = demand_hours + TimeDifference.between(DateTime.current, demand.created_at).in_minutes
                    else
                        next if i == demand.steps.length - 1
                        # Somo a a diferença de tempo da criação de um passo para o outro
                        demand_hours = demand_hours + TimeDifference.between(demand.steps[i + 1].created_at, step.created_at).in_minutes
                    end
                end
                demand_hours
            end
            @median = DescriptiveStatistics::Stats.new(@real_duration).median
            @duration = ActiveRecord::Base.connection.exec_query("SELECT EXTRACT(DAY FROM demands.updated_at - demands.created_at) FROM demands")

            #You can specify instance variables
            @custom_stats = "grab your stats here."

            #After you're done processing everything, render the new dashboard
            render @action.template_name, status: 200
        end
    end

    register_instance_option :route_fragment do
        ''
    end

    register_instance_option :link_icon do
        'icon-home'
    end

    register_instance_option :statistics? do
        true
    end
end