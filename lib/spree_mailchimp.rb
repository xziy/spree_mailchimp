require "spree_core"
require "spree_mailchimp/engine"
require "spree_mailchimp/version"

module SpreeMailchimp
  class List    
    require "gibbon"

    # TODO allow configuration of timeout
    def initialize
      return false unless mailchimp_configured?
      @gibbon = Gibbon::Request.new(api_key: Spree::Config[:mailchimp_api_key])
      @gibbon.timeout = 5
    end

    # TODO allow merge tags to be sent
    # TODO do not fail silently
    def subscribe(user)
      begin
        @gibbon.lists(Spree::Config[:mailchimp_list_id]).members.create(body: {email_address: user.email, status: "subscribed"})
      rescue
      end
    end

    # TODO do not fail silently
    def update(user)
      begin
        @gibbon.lists(Spree::Config[:mailchimp_list_id]).members.upsert(body: {email_address: user.email, status: "subscribed"})
      rescue
      end
    end


    # TODO do not fail silently
    def unsubscribe(user)
      begin
        @gibbon.lists(Spree::Config[:mailchimp_list_id]).members(Digest::MD5.hexdigest(user.email.downcase)).update(body: { status: "unsubscribed" })
      rescue
      end
    end

    private

    def mailchimp_configured?
      !(Spree::Config[:mailchimp_api_key].nil? ||
        Spree::Config[:mailchimp_api_key].empty? ||
        Spree::Config[:mailchimp_list_id].nil? ||
        Spree::Config[:mailchimp_list_id].empty?
      )
    end
  end
end