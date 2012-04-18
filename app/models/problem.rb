class Problem < ActiveRecord::Base
  attr_accessible :correct, :description, :title, :wrong1, :wrong2, :wrong3
  self.per_page = 10

  belongs_to :creator, class_name: User
  has_many :answers, :dependent => :destroy
  has_many :solvers, through: :answers, source: :user

  def random_choices
    [correct, wrong1, wrong2, wrong3].shuffle
  end
end
