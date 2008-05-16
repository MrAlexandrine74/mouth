namespace :db do
  task :setup     => [ :create, :migrate, :bootstrap ]
  task :bootstrap => [ :default_preferences ]
  
  desc "Import the default preferences into the database."
  task :default_preferences => :environment do
    require 'yaml'
    yaml = YAML.load_file("#{File.dirname(__FILE__)}/../../test/fixtures/preferences.yml")
    @preferences_set = yaml.keys.collect do |key| # Make into Ruby, sure there is a cleaner way to do this.
      set_preference_unless_exists(yaml[key])
    end
      # @set = []
    # set_preference_unless_exists("site_name", "Mouth")  
    # @set << "nothing" if @set.empty?
    puts "Set #{@preferences_set.to_sentence}."
  end
end

private
  def set_preference_unless_exists(record)
    name, value = record['name'], record['value']
    unless Preference.get(name, true)
      Preference.set(name, value)
      name
    end
  end
