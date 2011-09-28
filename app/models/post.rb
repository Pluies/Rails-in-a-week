class Post < ActiveRecord::Base

  validates :body,  :presence => true
  validates :title, :presence => true,
    :length => { :minimum => 5 }
  has_many :comments, :dependent => :destroy

  acts_as_gmappable
  def gmaps4rails_address
    "101-115 Main St, San Francisco, CA 94105, USA"
  end

end
