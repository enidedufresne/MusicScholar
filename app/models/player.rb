# == Schema Information
#
# Table name: players
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#

class Player < ActiveRecord::Base
	has_many :responses
	has_many :player_questions
	has_many :questions, through: :player_questions
	# has_many :points

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         def points
          # refactor into single query without map

          # go to responses datatable, return me responses where 
          ## the player is the same player this method is being used on
          # => [<response><response>]
          Response.where(player: self).map{ |response|
            if response.option.correct
              response
            else
              nil
            end
          }.compact.count
          # => [nil, <response>, <response>, nil, <response>].compact
          # => [<response>, <response>, <response>].count
          # => 3
         end
end

