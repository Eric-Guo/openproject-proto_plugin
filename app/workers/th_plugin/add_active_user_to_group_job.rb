class ThPlugin::AddActiveUserToGroupJob < ApplicationJob
  def perform
    user_positions = Cybros::PositionUser.active_position_user_by_group_name
    user_positions.each do |group_name, position_users|
      next if group_name.blank?

      group = Group.find_by(name: group_name)
      next if group.blank?

      users_in_op = position_users.collect { |pu| pu.user.op_user }.reject(&:nil?).uniq
      group.add_members_to_group(User.system, users_in_op)
    end
  end
end