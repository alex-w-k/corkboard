# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( telephone/utils.js )
Rails.application.config.assets.precompile += %w( search.js
                                                  home/home.js
                                                  nav/search.js
                                                  user_dashboard.js
                                                  bids/form.js
                                                  map.js)
