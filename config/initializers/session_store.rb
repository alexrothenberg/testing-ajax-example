# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_testing-ajax-example_session',
  :secret      => 'f3bfe69caa92cd2c07ea2ad6003dc7543e77102ffc3b8c5f21006ec21e062f6d2a0c989239809f24b497077f10cf5dd2f902f90d1d6bcec00fafcdcc8c6fc49a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
