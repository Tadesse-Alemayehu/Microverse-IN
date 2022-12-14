class User < ApplicationRecord
  validates :first_name, presence: true
  validates :first_name, length: { minimum: 2, maximum: 60 }
  validates :last_name, presence: true
  validates :last_name, length: { minimum: 2, maximum: 60 }
  validates :status, inclusion: ["Active", "Inactive"]
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,    message: "Email is not valid" }

  def first_name=first_name
    p "setting up last name "
    f=first_name.slice!(0,1)
    f=f.upcase
    super(f+first_name)
  end

    def last_name=last_name
    p "setting up last name "
    f=last_name.slice!(0,1)
    f=f.upcase
    super(f+last_name)
  end
end
