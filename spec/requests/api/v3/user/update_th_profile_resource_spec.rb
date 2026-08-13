# frozen_string_literal: true

require "spec_helper"
require "rack/test"

RSpec.describe API::V3::Users::UsersAPI do
  include API::V3::Utilities::PathHelper

  let(:current_user) { create(:admin) }
  let!(:target_user) { create(:user) }
  let(:parameters) do
    {
      company: "company2",
      th_department: "department2",
      title: "title2",
      mobile: "13901862171"
    }
  end

  before do
    login_as(current_user)
  end

  it "updates the TH profile attributes" do
    definition = API::V3::Users::UserPayloadRepresenter.representable_attrs["th_department"]
    expect(definition).to be_present
    expect(definition[:as].call).to eq("th_department")

    parsed = API::V3::ParseResourceParamsService
      .new(current_user, model: User, representer: API::V3::Users::UserPayloadRepresenter)
      .call(parameters.stringify_keys)

    expect(parsed.result).to include(th_department: "department2")

    header "Content-Type", "application/json"
    patch api_v3_paths.user(target_user.id), parameters.to_json

    expect(last_response).to have_http_status(:ok)

    updated_user = target_user.reload
    expect(updated_user.company).to eq("company2")
    expect(updated_user.th_department).to eq("department2")
    expect(updated_user.title).to eq("title2")
    expect(updated_user.mobile).to eq("13901862171")

    response = parse_json(last_response.body)
    expect(response).to include(
      "company" => "company2",
      "th_department" => "department2",
      "title" => "title2"
    )
    expect(response).not_to have_key("department")
  end
end
