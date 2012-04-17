class User < ActiveRecord::Base
  attr_accessible :uid, :name, :key, :secret

  validates_presence_of :uid, :name, :key, :secret
  validates_uniqueness_of :uid

  def self.create_with_omniauth(auth)
    create!(uid: auth["uid"], name: auth["info"]["name"], key: auth.credentials.token, secret: auth.credentials.secret)
  end


end
