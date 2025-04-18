require 'sequel'

Sequel::Database.extension :error_sql

Sequel::Database.register_extension(
  :appsignal_integration,
  Appsignal::Hooks::SequelLogConnectionExtension
)
Sequel::Database.extension(:appsignal_integration)

# Set up database connection
DB = Sequel.connect('sqlite://db/development.sqlite3')

# Create the users table if it doesn't exist
DB.create_table? :users do
  primary_key :id
  String :name, null: false
  String :email, null: false, unique: true
  DateTime :created_at
  DateTime :updated_at
end
