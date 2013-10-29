require "mobile_intent/version"
require "mobile_intent/application"
require "mobile_intent/config"

module MobileIntent
  def self.config
    @config ||= Config.new
  end

  def self.setup(&block)
    config.instance_exec(&block)
  end
end
