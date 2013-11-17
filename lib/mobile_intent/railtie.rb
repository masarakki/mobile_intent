require 'rails'

module MobileIntent
  class Railtie < ::Rails::Railtie
    initializer "mobile_intent.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include MobileIntent::Helpers
      end

      ActiveSupport.on_load(:action_view) do
        include MobileIntent::Helpers
      end
    end

    config.before_configuration do
      if config.action_view.javascript_expansions
        config.action_view.javascript_expansions[:defaults] |= ['mobile_intent']
      end
    end
  end
end
