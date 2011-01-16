require 'faker'

namespace :db do
  desc "Fill database w sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_locations
    make_categories
    make_microposts
  end
end

def make_users
    admin = User.create!(:name => "Admin", :email => "admin@admin.com", :password => "password", :password_confirmation => "password")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Internet.user_name
      email = "example-#{n+1}@watever.com"
      password = "password"
      User.create!(:name => name, :email => email, :password => password, :password_confirmation => password)
    end  
end

def make_microposts
    User.all(:limit => 6).each do |user|
      50.times do |n|
        user.microposts.create!(:title => Faker::Lorem.sentence(1), :content => Faker::Lorem.paragraphs(3), :location_id => n.modulo(10), :category_id => n.modulo(10), :compensation => 10 + rand(25))
      end
    
    end  
  end
    
def make_locations
    50.times do |n|
      name = Faker::Address.city
      Location.create!(:name => name)
    end   


end

def make_categories
    50.times do |n|
      name = Faker::Company.bs
      name_array = name.split
      name = name_array[1].capitalize + " " + name_array[2].capitalize
      Category.create!(:name => name)
    end   
end