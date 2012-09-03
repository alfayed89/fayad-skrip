class User < ActiveRecord::Base
  attr_accessible :nama, :password, :role_type, :user_name
end
