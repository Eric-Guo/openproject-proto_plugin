#-- copyright
# OpenProject ThPlugin Plugin
#
# Copyright (C)2016-2017 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 3.
#
# OpenProject Backlogs is a derivative work based on ChiliProject Backlogs.
# The copyright follows:
# Copyright (C) 2010-2011 - Emiliano Heyns, Mark Maglana, friflaj
# Copyright (C) 2011 - Jens Ulferts, Gregor Schmidt - Finn GmbH - Berlin, Germany
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.rdoc for more details.
#++

require "spec_helper"

RSpec.describe "Project members", type: :feature, js: true do
  let(:permissions) { %i[view_th_plugin_members view_members] }
  let(:project) { create(:project, enabled_module_names: %w[th_members_module]) }
  let(:user) { create(:user, member_with_permissions: { project => permissions }) }

  before { login_as user }

  it "lists the project members and filters by name" do
    colleague = create(:user, firstname: "Jules", lastname: "Marin", member_with_permissions: { project => [:view_members] })

    visit th_plugin_project_th_members_path(project_id: project.id)

    within "opce-th-project-members" do
      expect(page).to have_css("td.name", text: user.name)
      expect(page).to have_css("td.name", text: colleague.name)

      find_button(title: "筛选器").click
      fill_in "name", with: colleague.lastname
      click_on "应用"

      expect(page).to have_no_css("td.name", text: user.name)
      expect(page).to have_css("td.name", text: colleague.name)
    end
  end

  context "without permission to view project members" do
    let(:permissions) { [:view_project] }

    it "denies access" do
      visit th_plugin_project_th_members_path(project_id: project.id)

      expect(page).to have_text("You are not authorized to access this page.")
    end
  end
end
