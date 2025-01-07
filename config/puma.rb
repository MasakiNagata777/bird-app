# Puma threads configuration
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Bind to 0.0.0.0 and use PORT environment variable
port ENV.fetch("PORT") { 3000 }
bind "tcp://0.0.0.0:#{ENV.fetch("PORT", 3000)}"

# Set the environment
environment ENV.fetch("RAILS_ENV") { "development" }

# PID and state file locations
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }
state_path ENV.fetch("STATEFILE") { "tmp/pids/server.state" }

# Workers (useful for multi-threaded environments)
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Preload app for workers
preload_app!

# Allow restart with `rails restart`
plugin :tmp_restart
