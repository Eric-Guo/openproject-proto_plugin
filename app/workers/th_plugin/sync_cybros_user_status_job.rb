class ThPlugin::SyncCybrosUserStatusJob < ApplicationJob
  def perform
    User.where('mail LIKE ?', '%@thape.com.cn').find_each do |user|
      next if user.staff.blank?

      if user.staff.locked_at.present?
        user.locked!
      end
    end
  end
end