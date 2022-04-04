Chef::Log.info("Running deploy/after_restart.rb...")

rails_env = new_resource.environment["RAILS_ENV"]
current_release = release_path
log_dir = "/srv/www/trooptrack_web/shared/log"


bash "start resque workers" do
  user "root"
  cwd current_release
  code <<-EOH
    monit status
  EOH

end


bash "start mailman server" do
  user "root"
  cwd current_release
  code <<-EOH
    monit status
  EOH
end
# monit start mailman
