namespace :respaldar_bd do

task :execute_on_server do
  on "http://192.168.1.119:3000/" do
    execute "bundle exec cap development whenever:update_crontab --trace"
    execute "backup perform --trigger my_backup"
  end
end


end