class AddMailchimpOptInToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :mailchimp_opt_in, :boolean, default: false
  end
end
