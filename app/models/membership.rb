class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :gym_id, presence: true
  validates :client_id, presence: true
  validates :charge, presence: true
  validate :unique_client

  def unique_client
    if gym_id == client_id
      errors.add('A client can have only one membership with each gym')
    end
  end
end
