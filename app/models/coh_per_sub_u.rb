class CohPerSubU < ActiveRecord::Base
  include CodeGenerator
  belongs_to :subject_user
  belongs_to :cohort_period
  belongs_to :schedule_cohort_period
  has_many :classroom_laboratory_schedules, through: :session
  has_many :sch_per_us
  has_many :sub_per_users

  def self.between(start_time, end_time)
    where('starts_at > :lo and starts_at < :up',
      :lo => CohPerSubU.format_date(start_time),
      :up => CohPerSubU.format_date(end_time)
    )
  end
  def self.format_date(date_time)  
   Time.at(date_time.to_i).to_formatted_s(:db)  
  end 
  
  def as_json(options = {})  
   {  
    :id => self.id,  
    :title => self.title,  
    :description => self.description || "",  
    :start => start,  
    :end => end_was,  
    :recurring => false,  
    :url => Rails.application.routes.url_helpers.coh_per_sub_us_path(id),  
   }   
  end
end
