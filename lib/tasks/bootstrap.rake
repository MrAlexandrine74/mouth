namespace :db do
  task :setup     => [ :create, :migrate, :bootstrap ]
  task :bootstrap => [ :default_preferences, :default_user ]
  
  desc "Import the default preferences into the database."
  task :default_preferences => :environment do
    require 'yaml'
    yaml = YAML.load_file("#{File.dirname(__FILE__)}/../../spec/fixtures/preferences.yml")
    @preferences_set = yaml.keys.collect do |key| # Make into Ruby, sure there is a cleaner way to do this.
      set_preference_unless_exists(yaml[key])
    end
      # @set = []
    # set_preference_unless_exists("site_name", "Mouth")  
    # @set << "nothing" if @set.empty?
    puts "Set #{@preferences_set.to_sentence}."
  end
  
  desc "Create default admin user"
  task :default_user => :environment do
    # ENV['LOGIN'], ENV['EMAIL'], ENV['PASSWORD']
    user = User.create!(
      :login => (ENV['LOGIN'] || "admin"),
      :email => (ENV['EMAIL'] || "youremail@whatever.com"),
      :password => (ENV['PASSWORD'] || "password"), 
      :password_confirmation => (ENV['PASSWORD'] || "password"),
      :state => "admin"
    )
    if user.errors.any?
      puts "Could not create your user, the errors were: #{user.errors.full_messages.to_sentence}."
    else
      puts "Created your admin, sign in at '#{user.login}' and '#{user.password}'."
    end
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
