# == Schema Information
#
# Table name: authentications
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  provider         :string           not null
#  uid              :string           not null
#  token            :string
#  token_expires_at :datetime
#  params           :json
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_authentications_on_provider_and_uid  (provider,uid) UNIQUE
#  index_authentications_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Authentication < ApplicationRecord
  belongs_to :user, inverse_of: :authentications

  class << self
    def from_omniauth(params, user)
      find_or_initialize_by(provider: params['provider'], uid: params['uid']).tap do |auth|
        transaction do
          auth.user ||= user || User.create!
          auth.assign_attributes(
            token: params['credentials']['token'],
            token_expires_at: params['credentials']['expires_at'] && Time.at(params['credentials']['expires_at']).to_datetime,
            params: params
          )
          auth.save! if auth.changed?
        end
      end
    end
  end
end
