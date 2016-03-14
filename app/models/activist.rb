class Activist < ActiveRecord::Base
    
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: {minimum: 3, maximum: 25}
    validates :surname, presence: true, length: {minimum: 3, maximum: 25}
    validates :username, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
                        uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }
    validates_inclusion_of :whatsApp, :in => [true, false]
    validates_inclusion_of :facebook, :in => [true, false]
    validates_inclusion_of :skype, :in => [true, false]
    validates_inclusion_of :google_plus, :in => [true, false]
    validates_inclusion_of :twitter, :in => [true, false]
    validates_inclusion_of :mov_five_star, :in => [true, false]
    validates_inclusion_of :meet_up, :in => [true, false]
end
