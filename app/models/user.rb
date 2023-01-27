class User < ActiveRecord::Base
    validates_presence_of :full_name, :location
    validates_length_of :bio, minimum: 30, allow_black: false

    validates :email, presence: true,
                      format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ },
                      uniqueness: true

    has_secure_password

    before_create do |user|
      user.confirmation_token = SecureRandom.urlsafe_base64
    end

    def confirm!
      return if confirmend?

        self.confirmend_at = Time.current
        self.confirmation_token  = ''
        save!
    end

    def confirmend?
      confirmend_at.present?
    end
end
