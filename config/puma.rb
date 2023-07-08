# workers Integer(ENV.fetch("WEB_CONCURRENCY") { 2 })
max_threads_count = Integer(ENV.fetch("RAILS_MAX_THREADS") { 5 })
min_threads_count = Integer(ENV.fetch("RAILS_MIN_THREADS") { max_threads_count })
threads min_threads_count, max_threads_count
# preload_app!
# rackup      DefaultRackup
# コメントアウト
# port ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RACK_ENV") { "development" }
# nginx ソケット通信設定追加
# app_root：__dir__（現在のファイルのディレクトリ）の親ディレクトリを取得
app_root = File.expand_path('..', __dir__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"
# bind "unix://#{Rails.root}/tmp/sockets/puma.sock"
stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true

# on_worker_boot do
#   ActiveRecord::Base.establish_connection
# end

plugin :tmp_restart