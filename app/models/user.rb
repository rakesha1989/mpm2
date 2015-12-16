class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  has_many :permissions
  has_many :roles, through: :permissions
  has_many :meeting_users
  has_many :meetings, through: :meeting_users
  has_many :assignment_users
  has_many :assignments, through: :assignment_users
  belongs_to :company
  belongs_to :meeting
  has_one :profile , dependent: :destroy


def role?(role)
    self.roles.pluck(:name).include?(role)
end

def setup_user_role
    if user.roles.empty?
      user.roles << Role.third
  end
end


end
