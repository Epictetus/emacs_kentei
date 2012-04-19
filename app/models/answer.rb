class Answer < ActiveRecord::Base
  attr_accessible :choice, :user, :correct

  belongs_to :user
  belongs_to :problem

  def correct?
    correct
  end
end
