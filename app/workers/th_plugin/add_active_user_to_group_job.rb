class ThPlugin::AddActiveUserToGroupJob < ApplicationJob
  def perform
    user_positions = Cybros::PositionUser.active_position_user_by_group_name
    user_positions.each do |group_name, position_users|
      next if group_name.blank?

      group = Group.find_by(name: group_name)
      next if group.blank?

      users_in_op_ids = position_users.collect { |pu| pu.user.op_user }.reject(&:nil?).uniq.collect(&:id)
      current_user_ids = group.group_users.pluck(:user_id)
      remove_user_ids = Cybros::User.where(id: current_user_ids.uniq).where.not(locked_at: nil).pluck(:id)
      group.add_and_remove_members_to_group(User.system, users_in_op_ids, remove_user_ids)
    end
  end
end