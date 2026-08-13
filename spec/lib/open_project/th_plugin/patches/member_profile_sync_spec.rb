require "spec_helper"

RSpec.describe "TH member profile sync" do
  let(:project) { create(:project) }
  let(:role) { create(:project_role) }
  let(:user) do
    create(
      :user,
      firstname: "Yanwu",
      lastname: "Li",
      company: "Shanghai THA",
      th_department: "MEP",
      title: "Senior Electrical Engineer",
      mobile: "18210039594"
    )
  end
  let(:member) { create(:member, user:, project:, roles: [role]) }

  describe "#update_member_profiles" do
    it "updates the existing profile when the membership caches a missing profile" do
      profile = MemberProfile.find_or_create_by!(member_id: member.id)
      profile.update_columns(name: "", company: "", department: "", position: "", mobile: "")

      profile_association = member.association(:profile)
      profile_association.target = nil
      profile_association.loaded!

      expect(member.profile).to be_nil

      allow(user).to receive(:members).and_return([member])
      allow(user).to receive(:staff).and_return(nil)

      expect { user.update_member_profiles }.not_to change(MemberProfile, :count)

      profile.reload

      aggregate_failures do
        expect(profile.name).to eq(user.name)
        expect(profile.company).to eq(user.company)
        expect(profile.department).to eq(user.th_department)
        expect(profile.position).to eq(user.title)
        expect(profile.mobile).to eq(user.mobile)
      end
    end
  end

  describe "#set_default_profile" do
    it "reuses the existing member profile" do
      profile = MemberProfile.find_or_create_by!(member_id: member.id)

      expect { member.set_default_profile }.not_to change(MemberProfile, :count)
      expect(member.profile&.id || MemberProfile.find_by!(member_id: member.id).id).to eq(profile.id)
    end
  end
end
