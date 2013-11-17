require "mobile_intent/version"
require "mobile_intent/application"
require "mobile_intent/config"
require "mobile_intent/railtie"
require "mobile_intent/engine"

require "mobile_intent/helpers"

module MobileIntent
  def self.config
    @config ||= Config.new
  end

  def self.setup(&block)
    config.instance_exec(&block)
  end
end
