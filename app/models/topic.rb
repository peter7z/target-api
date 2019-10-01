# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
end
