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

require 'rails_helper'

RSpec.describe Authentication, type: :model do
  describe 'associations' do
    it{ is_expected.to belong_to(:user).inverse_of(:authentications) }
  end

  describe 'class methods' do
    describe '.from_omniauth' do
      subject{ Authentication.from_omniauth(params, user) }
      let(:user){ nil }

      Devise.omniauth_providers.each do |provider|
        context "providerが#{provider}のとき" do
          let(:params){ Faker::Omniauth.send(provider).with_indifferent_access }

          context 'すでにauthenticationがあるとき' do
            let(:authentication){ create(:authentication, provider: Authentication.provider_name(params['provider']), uid: params['uid']) }

            before do
              authentication
            end

            it 'Authenticationは増えない' do
              expect{ subject }.to_not change{ Authentication.count }
            end

            it 'Userは増えない' do
              expect{ subject }.to_not change{ User.count }
            end

            it{ is_expected.to eq authentication }
          end

          context 'まだauthenticationがないとき' do
            context 'userが渡されたとき' do
              let(:user){ create(:user) }

              before do
                user
              end

              it 'Authenticationが増える' do
                expect{ subject }.to change{ Authentication.count }.by(1)
              end

              it 'Userは増えない' do
                expect{ subject }.to_not change{ User.count }
              end

              its(:user){ is_expected.to eq user }
            end

            context 'userが渡されなかったとき' do
              it 'Authenticationが増える' do
                expect{ subject }.to change{ Authentication.count }.by(1)
              end

              it 'Userが増える' do
                expect{ subject }.to change{ User.count }.by(1)
              end
            end
          end
        end
      end
    end
  end
end
