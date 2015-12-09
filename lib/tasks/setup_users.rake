desc "setup users and roles"
task :setup_users => :environment do
Role.create(name: "director")
Role.create(name: "admin")
Role.create(name: "user")

user = User.new
user.email = "raag.ices@gmail.com"
user.password = "secret123"
user.save
user.roles << Role.first

user = User.new
user.email = "gajendra.qubik@gmail.com"
user.password = "secret123"
user.save
user.roles << Role.second

users = User.where('email != ? AND email != ?', "raag.ices@gmail.com", "gajendra.qubik@gmail.com")
for user in users	
	user.roles << Role.third
end
end
