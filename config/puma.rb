# Puma threads configuration
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Port to bind Puma to (Render recommends binding to 0.0.0.0)
port ENV.fetch("PORT") { 3000 }
bind "tcp://0.0.0.0:#{ENV.fetch('PORT', 3000)}"

# Set the environment (default to production for Render)
environment ENV.fetch("RAILS_ENV") { "production" }

# PID and state file locations
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }
state_path ENV.fetch("STATEFILE") { "tmp/pids/server.state" }

# Workers (useful for multi-threaded environments)以下変更4→１
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Preload app for workers
preload_app!

# Allow restart with `rails restart`
plugin :tmp_restart

# Before fork: This is used to disconnect the database connection before forking workers
before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end

# On worker boot: Reconnect the database
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }
state_path ENV.fetch("STATEFILE") { "tmp/pids/server.state" }

# 以下追加
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# E以下追加以下追加以下追加以下追加
directory = "tmp/pids"
FileUtils.mkdir_p(directory) unless File.directory?(directory)
