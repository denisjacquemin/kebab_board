# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kebab_session',
  :secret      => '2579d514bb0eb71d9234c4d1d6e5816c749e287b75d30eec261532f440ce0f631152416021f6d9653eabdc67e7d9bbbb5f2c4238af9b1c91280334e52d89205b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
