# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ThPlugin::AddActiveUserToGroupJob do
  subject(:perform_job) { described_class.perform_now }

  let(:group_name) { '上海天华-公建五所' }
  let(:op_user) { create(:user) }
  let(:position_user) { double(user: double(op_user: op_user)) }

  before do
    position_user_model = Class.new do
      def self.active_position_user_by_group_name; end
    end
    cybros_user_model = Class.new do
      def self.where(...); end
    end

    stub_const('Cybros::PositionUser', position_user_model)
    stub_const('Cybros::User', cybros_user_model)

    where_chain = double(not: [])
    cybros_user_scope = double(where: where_chain)
    allow(position_user_model)
      .to receive(:active_position_user_by_group_name)
      .and_return(group_name => [position_user])
    allow(cybros_user_model).to receive(:where).with(id: []).and_return(cybros_user_scope)
  end

  it 'creates a missing group and adds its active users' do
    perform_job

    expect(Group.find_by!(name: group_name).users).to contain_exactly(op_user)
  end
end
