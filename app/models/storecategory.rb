class Storecategory < ActiveRecord::Base
  belongs_to :store
  belongs_to :category
  
  scope :by_store ,lambda{ |store_id| where(store_id: store_id)}
end
