Spree::Core::Engine.add_routes do

  namespace :admin do
    get '/mailchimp', to: 'mailchimp#edit', as: :edit_mailchimp
    put '/mailchimp', to: 'mailchimp#update', as: :update_mailchimp
  end

end


