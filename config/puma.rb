max_threads_count = Integer(ENV.fetch("RAILS_MAX_THREADS", 5))
min_threads_count = Integer(ENV.fetch("RAILS_MIN_THREADS") { max_threads_count })
threads min_threads_count, max_threads_count

environment ENV.fetch("RAILS_ENV") { "development" } # RACK_ENV→RAILS_ENV

bind "unix:///app/tmp/sockets/puma.sock"

plugin :tmp_restart
