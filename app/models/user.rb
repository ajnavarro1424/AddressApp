class User < ActiveRecord::Base
  rolify
  has_many :apartments #add this line
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :assign_role

  def assign_role
    add_role(:poster)
  end
end
