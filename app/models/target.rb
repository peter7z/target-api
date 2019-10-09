# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  latitude   :float            not null
#  longitude  :float            not null
#  radius     :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_targets_on_topic_id  (topic_id)
#  index_targets_on_user_id   (user_id)
#

class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :title, presence: true
  validates :radius, presence: true, numericality: { greater_than: 0, less_or_equal_than: 5000 }
  validates :latitude, :longitude, presence: true, numericality: true

  validate :targets_count_limit, on: :create

  def targets_count_limit
    return unless self.user.targets.size >= 10

    errors.add(:limit, I18n.t('max_targets'))
  end
end
