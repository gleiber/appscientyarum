class User < ActiveRecord::Base
  	 attr_accessor :avatar
    attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :role
  belongs_to :sex
  belongs_to :cohort_program
  has_one :tutor
  has_one :project
  has_one :thesis
  belongs_to :line_investigation
  has_one :program
  has_many :subject_users
  has_many :request_class_labs
  has_many :user_area_interest
  has_many :area_interests, through: :user_area_interest
  has_many :user_ownership
  has_many :ownerships, through: :user_ownership

  has_many :user_collection
  has_many :collections, through: :user_collection


  has_many :sub_per_user
  has_many :subjects, through: :sub_per_user

  has_many :cohort_user
  has_many :cohorts, through: :cohort_user


  after_create :send_mail


  #validates :nombre, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  #validates :email, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  #validates :username, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  #validates :role_id, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}
  #validates :password, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}

  def send_mail
    UserMailer.new_user(self).deliver_now
  end

  def email_required?
    false
  end

end
