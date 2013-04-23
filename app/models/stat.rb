class Stat < ActiveRecord::Base
  attr_accessible :clicks, :post_id
  belongs_to :post
end
