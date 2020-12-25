require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SHARESnow
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.paths.add 'lib', eager_load: true # 追加
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end

module TimeFormatSandbox
  class Application < Rails::Application
    # ...

    # タイムゾーンを日本時間に設定
    config.time_zone = 'Asia/Tokyo'
  end
end

module Projects
    class Application < Rails::Application
      config.load_defaults 5.1

     # Railsが最初から書いているコメントは省略 ...

     config.generators do |g|
       g.test_framework :rspec,
         view_specs: false,
         helper_specs: false,
         routing_specs: false
     end
    end
end

end
