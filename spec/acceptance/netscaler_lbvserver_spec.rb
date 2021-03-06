require 'spec_helper_acceptance'

describe 'lbvserver tests' do
  it 'makes a lbvserver' do
    pp=<<-EOS
    netscaler_lbvserver { '1_8_lbvserver1':
      ensure       => 'present',
      service_type => 'DNS',
      state        => true,
    }
    EOS
    make_site_pp(pp)
    run_device(:allow_changes => true)
    run_device(:allow_changes => false)
  end

  it 'makes and edits a lbvserver' do
    pp=<<-EOS
    netscaler_lbvserver { '1_8_lbvserver2':
      ensure       => 'present',
      service_type => 'HTTP',
      ip_address   => '1.8.2.1',
      port         => '8080',
      state        => true,
    }
    EOS
    make_site_pp(pp)
    run_device(:allow_changes => true)
    run_device(:allow_changes => false)

    pp=<<-EOS
    netscaler_lbvserver { '1_8_lbvserver2':
      ensure       => 'present',
      service_type => 'HTTP',
      ip_address   => '1.8.2.2',
      port         => '8080',
      state        => true,
    }
    EOS
    make_site_pp(pp)
    run_device(:allow_changes => true)
    run_device(:allow_changes => false)
  end

  it 'makes and deletes a lbvserver' do
    pp=<<-EOS
    netscaler_lbvserver { '1_8_lbvserver3':
      ensure       => 'present',
      service_type => 'HTTP',
      ip_address   => '1.8.3.1',
      port         => '8080',
      state        => true,
    }
    EOS
    make_site_pp(pp)
    run_device(:allow_changes => true)
    run_device(:allow_changes => false)

    pp=<<-EOS
    netscaler_lbvserver { '1_8_lbvserver3':
      ensure => 'absent',
    }
    EOS
    make_site_pp(pp)
    run_device(:allow_changes => true)
    run_device(:allow_changes => false)
  end

end
