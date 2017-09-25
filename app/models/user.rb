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

class User < ApplicationRecord
  devise :rememberable, :trackable, :omniauthable

  has_many :authentications, inverse_of: :user

  validates :name,
    presence: true,
    length: {maximum: 30}
  validates :image_url,
    format: {with: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true}
end
