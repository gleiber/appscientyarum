namespace :deploy do
  desc "Update crontab with whenever"
  task :update_cron do
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, "whenever --update-crontab #{fetch(:application)}"
        execute "backup perform --trigger my_backup"
        execute :bundle, :exec, "backup perform --trigger my_backup"
      end
    end
  end

  after :finishing, 'deploy:update_cron'
end
