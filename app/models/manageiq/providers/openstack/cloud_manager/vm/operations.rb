module ManageIQ::Providers::Openstack::CloudManager::Vm::Operations
  include_concern 'Guest'
  include_concern 'Power'

  def raw_destroy
    raise "VM has no #{ui_lookup(:table => "ext_management_systems")}, unable to destroy VM" unless ext_management_system
    with_provider_object(&:destroy)
    self.update_attributes!(:raw_power_state => "DELETED")
  end
end
