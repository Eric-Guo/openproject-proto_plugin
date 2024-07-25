class ThPlugin::SyncCybrosUserStatusJob < ApplicationJob
  def perform
    User.where('mail LIKE ?', '%@thape.com.cn').find_each do |user|
      next if user.staff.blank?

      if user.staff.locked_at.blank?
        user.activate if user.status != 'active'
      else
        user.lock
      end
    end
  end
end