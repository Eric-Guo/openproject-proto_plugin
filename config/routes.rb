Rails.application.routes.draw do
  scope '', as: 'th_plugin' do
    scope 'projects/:project_id', as: 'project' do
      resources :th_members
    end
    resources :member_profiles,
              controller: 'th_plugin/member_profiles',
              only: %i[update],
              as: :member_profiles do
    end
  end

  # Create a route that is handled completely in the frontend
  # with a helper controller that just renders a plain page for the frontend
  # to hook into with its own route
  get '/angular_kittens', to: 'angular#empty_layout'
end