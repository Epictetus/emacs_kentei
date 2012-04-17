class User < ActiveRecord::Base
  attr_reader :name, :uid

  validates_presence_of :uid, :name, :key, :secret

  def self.create_with_omniauth(auth)
    create! do |user|
      p auth
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end


end
