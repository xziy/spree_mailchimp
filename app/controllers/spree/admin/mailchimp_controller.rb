# See spree_backend gem's Spree::Admin::GeneralSettingsController
module Spree
  module Admin
    class MailchimpController < Spree::Admin::BaseController
      
      include Spree::Backend::Callbacks

      def edit
      end

      def update
        params.each do |name, value|
          next unless Spree::Config.has_preference? name
          Spree::Config[name] = value
        end

        flash[:success] = Spree.t(:successfully_updated, scope: Spree.t(:mailchimp))
        redirect_to admin_edit_mailchimp_path
      end
    end
  end
end