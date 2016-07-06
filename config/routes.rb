Spree::Core::Engine.add_routes do

  namespace :admin, path: Spree.admin_path do
    get '/mailchimp', to: 'mailchimp#edit', as: :edit_mailchimp
    put '/mailchimp', to: 'mailchimp#update', as: :update_mailchimp
  end

end
