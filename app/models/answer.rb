class Answer < ActiveRecord::Base
  attr_accessible :choice

  belongs_to :user
  belongs_to :problem

  def correct?
    correct
  end
end
