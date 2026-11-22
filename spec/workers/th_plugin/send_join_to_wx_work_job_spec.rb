# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ThPlugin::SendJoinToWxWorkJob do
  it 'ignores memberships removed before the join notification runs' do
    member = create(:member, roles: [create(:project_role)])
    member.destroy!

    expect(Proto::OpService::Service).not_to receive(:current_client)
    described_class.perform_now(member.id)
  end
end
