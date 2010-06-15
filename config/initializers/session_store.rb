# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_elements_session',
  :secret      => '2ed7307d95caa7bf4363625e019ccdb2046ab749fb5eef3b501fabbc67c1e96b8badf13689b33ec2d8757ad0b50c61098c0b2a5b827048575a411c7ed88eed30'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
