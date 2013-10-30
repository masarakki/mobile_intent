require 'rails'

module MobileIntent
  class Railtie < ::Rails::Railtie
    initializer "mobile_intent.helpers" do
    end

    config.before_configuration do
      if config.action_view.javascript_expansions
        config.action_view.javascript_expansions[:defaults] |= ['mobile_intent']
      end
    end
  end
end
