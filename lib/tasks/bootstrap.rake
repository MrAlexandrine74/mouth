namespace :db do
  task :setup     => [ :create, :migrate, :bootstrap ]
  task :bootstrap => [ :default_preferences ]
  
  desc "Import the default preferences into the database."
  task :default_preferences => :environment do
    @set = []
    set_preference_unless_exists("site_name", "Mouth")  
    @set << "nothing" if @set.empty?
    puts "Set #{@set.to_sentence}."
  end
end

private
def set_preference_unless_exists(name, value)
  @set << name unless Preference.get(name)  
  Preference.set_unless_exists(name, value)
end