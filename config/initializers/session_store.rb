# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_elements_session',
  :secret      => 'd9ad7819f0e7c8b5f8a2d987ec1eef0d07c9c5be31bb303160ba56081bb8565d0579cad9711f63857efc950b63e37326d6ff70062355f9450f9059df0cca83bb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
