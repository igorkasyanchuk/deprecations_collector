class User < ActiveRecord::Base
  attr_accessible :name

  def hello
    ActiveSupport::Deprecation.warn("from model")
    "hello #{self.name}"
  end
end
