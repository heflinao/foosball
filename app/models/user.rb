class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :games

  def self.search(search)
    if search
      @users = User.where('first_name LIKE ?', "%#{search}%")
    else
      @users = User.all()
    end
  end
end
