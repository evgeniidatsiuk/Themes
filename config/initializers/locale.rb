
I18n.load_path += Dir[Rails.root.join('config', 'locales', 'models', '*', '*.yml').to_s]
I18n.load_path += Dir[Rails.root.join('config', 'locales', 'views', '*', '*.{rb,yml}').to_s]
I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]

I18n.default_locale = :uk
