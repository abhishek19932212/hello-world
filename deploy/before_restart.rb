Chef::Log.info("Running deploy/before_restart.rb...")

rails_env = new_resource.environment["RAILS_ENV"]
current_release = release_path
log_dir = "/srv/www/first_app/shared/log"

bash "stop resque workers" do
  user "root"
  cwd current_release
  code <<-EOH
    monit status >> /srv/www/first_app/shared/log/monit.log
  EOH

end

bash "stop mailman server" do
  user "root"
  cwd current_release
  code <<-EOH
    monit status
  EOH

end

execute 'foo' do
  command 'monit status'
  live_stream true
  action :run
end
