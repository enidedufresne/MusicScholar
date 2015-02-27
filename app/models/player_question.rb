class PlayerQuestion < ActiveRecord::Base
  belongs_to :player
  belongs_to :question
  has_many :questions, :through :player
end
