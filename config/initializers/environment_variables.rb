module EnvironmentVariablesExample
  class Application < Rails::Application
    config.before_configuration do
      file = Rails.root.join('config', 'robokassa_settings.yml').to_s
      if File.exists?(file)
        YAML.load_file(file)[Rails.env].each do |key, value|
          ENV[key.to_s] = value
        end
      end
    end
  end
end