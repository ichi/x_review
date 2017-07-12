# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :inet
#  last_sign_in_ip     :inet
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#  image_url           :text
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it{ is_expected.to have_many(:authentications).inverse_of(:user) }
  end
end
