class ThPlugin::AddActiveUserToGroupJob < ApplicationJob
  def perform
    user_positions = Cybros::PositionUser.active_position_user_by_group_name
    user_positions.each do |user_position|
      group_name = user_position[0]
      next if group_name.blank?

      group = Group.find_by(name: group_name)
    end
  end
end