class User < ActiveRecord::Base
  attr_accessible :uid, :name, :key, :secret

  validates_presence_of :uid, :name, :key, :secret
  validates_uniqueness_of :uid

  has_many :problems, foreign_key: :creator_id
  has_many :answers, :dependent => :destroy
  has_many :answered_problems, through: :answers, source: :problem

  def self.create_with_omniauth(auth)
    create!(uid: auth["uid"], name: auth["info"]["nickname"], key: auth.credentials.token, secret: auth.credentials.secret)
  end

  def self.most_solved(limit = 10)
    User.all(select: "#{User.table_name}.*, COUNT(#{Answer.table_name}.id) number_of_answers", joins: :answers, order: "number_of_answers DESC", limit: limit, group: :id)
  end

  def self.most_created(limit = 10)
    User.all(select: "#{User.table_name}.*, COUNT(#{Problem.table_name}.id) number_of_problems", joins: :problems, order: "number_of_problems DESC", limit: limit, group: :id)
  end

  def to_s
    name
  end

  def accuracy
    if answers.count > 0
      answers.where(correct: true).count / answers.count.to_f * 100
    else
      0.0
    end
  end

  def solved?(problem)
    answered_problems.include? problem
  end

  def twitter_url
    "https://twitter.com/#!/#{name}"
  end
end
