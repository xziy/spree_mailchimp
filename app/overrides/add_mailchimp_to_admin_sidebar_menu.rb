Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'mailchimp_admin_sidebar_menu',
  insert_bottom: '#main-sidebar',
  partial: 'spree/admin/shared/mailchimp_sidebar_menu'
)
