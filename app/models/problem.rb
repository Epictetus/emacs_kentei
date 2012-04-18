class Problem < ActiveRecord::Base
  attr_accessible :correct, :description, :title, :wrong1, :wrong2, :wrong3
  self.per_page = 10

  belongs_to :creator, class_name: User
  has_many :answers, :dependent => :destroy
  has_many :solvers, through: :answers, source: :user

  def random_choices
    [correct, wrong1, wrong2, wrong3].shuffle
  end

  def answer_by(user, choice)
    raise "Already answered" if solvers.include?(user)
    answers.create!(user: user, choice: choice, correct: correct == choice)
  end

  def myanswer(user)
    answers.find_by_user_id(user.id) || (raise "Not answered yet")
  end
end
