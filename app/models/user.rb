class User < ActiveRecord::Base
  rolify 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 #attr_accessor :role_name
 def before_add_method(role)
   self.add_role "#{role}"
 end
 
end
