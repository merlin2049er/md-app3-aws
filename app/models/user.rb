# frozen_string_literal: true

class User < ApplicationRecord
  devise :timeoutable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2]

  has_many :notifications
  has_many :transactions
  has_many :troubletickets

  acts_as_commontator

  # IT'S JUST AN EXAMPLE OF ANY ROLE SYSTEM
  # def admin?
  #  self == User.first
  # end

  def is_profile_complete
    if !firstname.blank? && !lastname.blank? && !username.blank? &&
         !address1.blank? && !city.blank? && !state.blank? && !postal.blank? &&
         !country.blank?
      true
    else
      false
    end
  end

  # YOU HAVE TO IMPLEMENT YOUR ROLE POLICY FOR COMMENTS HERE
  def comments_admin?
    admin?
  end

  def comments_moderator?(comment)
    id == comment.holder_id
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data =
           session['devise.facebook_data'] &&
             session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.firstname = auth.info.first_name # assuming the user model has a name
      user.lastname = auth.info.last_name # assuming the user model has a name
      user.image = auth.info.image # uncomment the line below to skip the confirmation emails. # If you are using confirmable and the provider(s) you use validate emails, # assuming the user model has an image
      user.skip_confirmation!
      user.save! if user.new_record?
    end
  end



  def set_defaults
    self.image ||= 'photo_not_available.png'
  end #  tracked owner: ->(controller,model) {controller && controller.current_user}
end
