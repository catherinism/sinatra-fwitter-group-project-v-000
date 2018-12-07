class User < ActiveRecord::Base
  has_many :tweets
  has_secure_password
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password

  def slug
    self.username.downcase.gsub(/\s+/,'-')
  end

  def self.find_by_slug(slug)
    User.all.find { |s| s.slug == slug }
  end

end
