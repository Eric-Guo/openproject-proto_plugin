module Members
  class ThMemberColumnComponent < ::ApplicationComponent
    options :form_id, :row, :params

    def member
      model
    end

    def form_html_options
      {
        id: "#{form_id}-form",
        class: row.toggle_item_class_name,
        style: "display:none",
        data: { "members-form-target": "membershipEditForm" }
      }
    end

    def form_url
      url_for form_url_hash
    end

    def form_url_hash
      {
        controller: "/th_members/member_profiles",
        action: "update",
        id: member.id,
        page: params[:page],
        per_page: params[:per_page]
      }
    end
  end
end
