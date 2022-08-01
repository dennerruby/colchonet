class User < ActiveRecord::Base
    validates_presence_of :full_name, :location
    validates_length_of :bio, minimum: 30, allow_black: false

    validates :email, presence: true,
                      format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ },
                      uniqueness: true

    has_secure_password
end
