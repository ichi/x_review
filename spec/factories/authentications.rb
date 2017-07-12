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


FactoryGirl.define do
  factory :authentication do
    user
    provider          { %i(twitter facebook).sample }
    uid               { params[:uid] }
    token             { params[:credentials][:token] }
    token_expires_at  { Time.at(params[:credentials][:expires_at]) if params[:credentials][:expires_at] }
    params            { Faker::Omniauth.send(provider) }
  end
end
