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


def role?(role)
  self.roles.pluck(:name).include?(role)
end


private

def setup_employee_role
  if Employee.where('email != ? AND email != ?', "raag.ices@gmail.com", "gajendra.qubik@gmail.com")
    for employee in employees 
      employee.roles << Role.third
    end
  end
end

end
