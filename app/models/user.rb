class User < ActiveRecord::Base
  scope :selceted_user ,-> {where(name:'asd')}
end
