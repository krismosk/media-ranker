require 'csv'

WORK_FILE = Rails.root.join('db', 'seed_data', 'works.csv')
puts "Loading raw driver data from #{WORK_FILE}"

work_failures = []
CSV.foreach(WORK_FILE, :headers => true) do |row|
  work = Work.new
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year']
  work.description = row['description']
  successful = work.save
  if !successful
    work_failures << work
    puts "Failed to save work: #{work.inspect}"
  else
    puts "Created work: #{work.inspect}"
  end
end

puts "Added #{Work.count} work records"
puts "#{work_failures.length} works failed to save"

# seed users
USER_FILE = Rails.root.join('db', 'seed_data', 'users.csv')
puts "Loading raw driver data from #{USER_FILE}"

user_failures = []
CSV.foreach(USER_FILE, :headers => true) do |row|
  user = User.new
  user.username = row['username']
  user.joined_date = row['joined_date']
  successful = user.save
  if !successful
    user_failures << user
    puts "Failed to save user: #{user.inspect}"
  else
    puts "Created user: #{user.inspect}"
  end
end

puts "Added #{User.count} user records"
puts "#{user_failures.length} users failed to save"

# seed votes