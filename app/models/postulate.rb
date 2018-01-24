class Postulate < ActiveRecord::Base
  include CodeGenerator
  belongs_to :offer

  has_many :postulate_collection
  has_many :collections, through: :postulate_collection

  #validates :decision, presence:  {case_sensitive: false ,message: "No puede estar en blanco"}


  #after_update :update_collection, :save_collection 

  def collections=(value)
    @collections = value
  end
  
  private
  
  def save_collection
    @collections.each do |collection_id|
      PostulateCollection.create(postulate_id: self.id, collection_id: collection_id)
    end
  end
  def update_collection
    @postulate_collections = PostulateCollection.find_by_sql "Select * From postulate_collections where postulate_id="+self.id.to_s+""
    @postulate_collections.each do |postulate_collection|
      postulate_collection.destroy
    end
  end

end
