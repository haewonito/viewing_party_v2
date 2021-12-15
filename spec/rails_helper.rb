# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data("Hide My Key") { ENV["govt_api_key"] }  #if you want to hide the key in the cassete
  config.configure_rspec_metadata!  #it will name the cassette automatically under the folder of spec test name, with folder named with the test name.
  config.default_cassette_options = { re_record_interval: 10.days }
end

def movie_test_data
    {
        "adult": false,
        "backdrop_path": "/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
        "belongs_to_collection": {
            "id": 230,
            "name": "The Godfather Collection",
            "poster_path": "/zqV8MGXfpLZiFVObLxpAI7wWonJ.jpg",
            "backdrop_path": "/pGl7NqNhyncju3Qu8LGA7owciMW.jpg"
        },
        "budget": 6000000,
        "genres": [
            {
                "id": 18,
                "name": "Drama"
            },
            {
                "id": 80,
                "name": "Crime"
            }
        ],
        "homepage": "http://www.thegodfather.com/",
        "id": 238,
        "imdb_id": "tt0068646",
        "original_language": "en",
        "original_title": "The Godfather",
        "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        "popularity": 57.352,
        "poster_path": "/eEslKSwcqmiNS6va24Pbxf2UKmJ.jpg",
        "production_companies": [
            {
                "id": 4,
                "logo_path": "/fycMZt242LVjagMByZOLUGbCvv3.png",
                "name": "Paramount",
                "origin_country": "US"
            },
            {
                "id": 10211,
                "logo_path": nil,
                "name": "Alfran Productions",
                "origin_country": "US"
            }
        ],
        "production_countries": [
            {
                "iso_3166_1": "US",
                "name": "United States of America"
            }
        ],
        "release_date": "1972-03-14",
        "revenue": 245066411,
        "runtime": 175,
        "spoken_languages": [
            {
                "english_name": "English",
                "iso_639_1": "en",
                "name": "English"
            },
            {
                "english_name": "Italian",
                "iso_639_1": "it",
                "name": "Italiano"
            },
            {
                "english_name": "Latin",
                "iso_639_1": "la",
                "name": "Latin"
            }
        ],
        "status": "Released",
        "tagline": "An offer you can't refuse.",
        "title": "The Godfather",
        "video": false,
        "vote_average": 8.7,
        "vote_count": 15131
    }
  end
