class User < ActiveRecord::Base
    # EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

    validates_presence_of :email, :full_name, :location, :password
    validates_confirmation_of :password
    validates_length_of :bio, minimum: 30, allow_black: false

    validates :email, presence :true,
                      format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ },
                      niqueness: true


    # private

    # def email_format
    #     erros.add(:email, invalid) unless email.match(EMAIL_REGEXP)
    #     end    
    # end
end
