class ThPlugin::AddActiveUserToGroupJob < ApplicationJob
  def perform
    user_positions = Cybros::PositionUser.active_position_user_by_group_name
    user_positions.each do |group_name, position_users|
      next if group_name.blank?

      group = Group.find_by(name: group_name)
      next if group.blank?

      users_in_op_ids = position_users.collect { |pu| pu.user.op_user }.reject(&:nil?).uniq.collect(&:id)
      current_group_cybros_user_ids = group.group_users.collect { |gu| gu.user.staff }.uniq.collect(&:id)
      remove_cybros_users = Cybros::User.where(id: current_group_cybros_user_ids.uniq).where.not(locked_at: nil)
      remove_user_ids = remove_cybros_users.collect { |cu| cu.op_user }.collect(&:id)
      group.add_and_remove_members_to_group(User.system, users_in_op_ids, remove_user_ids)
    end
  end
end