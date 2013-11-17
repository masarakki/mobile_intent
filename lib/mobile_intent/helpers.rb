module MobileIntent
  module Helpers
    def launch_app(*args, &block)
      if block_given?
        app_name = args.shift
        app_path = args.shift
      else
        text = args.shift
        app_name = args.shift
        app_path = args.shift
      end
      app = MobileIntent.config.apps[app_name.to_sym]
      url = app.launch_url(app_path, request.user_agent)
      if block_given?
        link_to(url, *args, &block)
      else
        link_to(text, url, *args)
      end
    end
  end
end
