class Problem < ActiveRecord::Base
  attr_accessible :correct, :description, :title, :wrong1, :wrong2, :wrong3
  self.per_page = 10
end
