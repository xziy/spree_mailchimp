module SpreeMailchimp
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Installs required migrations for spree_mailchimp"

      def copy_migrations
        rake "spree_mailchimp:install:migrations"
      end
    end
  end
end
