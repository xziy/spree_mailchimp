module Spree
  PermittedAttributes.user_attributes << :mailchimp_opt_in

  User.class_eval do
    after_save :sync_mailchimp_preferences

    private 

    def sync_mailchimp_preferences
      if mailchimp_list
        if mailchimp_opt_in
          if new_record? || mailchimp_opt_in_changed?
            mailchimp_list.subscribe(self)
          else
            mailchimp_list.update(self)
          end
        elsif !mailchimp_opt_in && !new_record? && mailchimp_opt_in_changed?
          mailchimp_list.unsubscribe(self)
        end
      end
    end


    def mailchimp_list
      @mailchimp_list ||= SpreeMailchimp::List.new
    end
  end
end