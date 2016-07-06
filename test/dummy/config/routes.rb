Rails.application.routes.draw do

  mount SpreeMailchimp::Engine => "/spree_mailchimp"
end
