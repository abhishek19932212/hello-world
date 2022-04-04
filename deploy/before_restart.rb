Chef::Log.info("Running deploy/before_restart.rb...")
Chef::Log.level = :debug

rails_env = new_resource.environment["RAILS_ENV"]
current_release = release_path
log_dir = "/srv/www/first_app/shared/log"

bash "stop resque workers" do
  user "root"
  cwd current_release
  code <<-EOH
    touch /var/log/monit1.log
    monit status >> /var/log/monit1.log
    cat /var/log/monit1.log
  EOH

end

bash "stop mailman server" do
  user "root"
  cwd current_release
  code <<-EOH
    touch /var/log/monit2.log
    monit status >> /var/log/monit2.log
    cat /var/log/monit2.log
  EOH

end
