require 'spec_helper'

describe 'chromerepo', :type => :class do

  context 'Fedora with no parameters, 64 bit' do
    let(:facts) {{ :osfamily => 'RedHat', :operatingsystem => 'Fedora', :architecture => 'x86_64', }}
    it { should compile.with_all_deps }
    it { should contain_yumrepo('google-chrome').with_baseurl('http://dl.google.com/linux/chrome/rpm/stable/x86_64') }
    it { should contain_yumrepo('google-chrome').with_descr('Google Chrome YUM repository') }
    it { should contain_yumrepo('google-chrome').with_enabled('1') }
    it { should contain_yumrepo('google-chrome').with_gpgcheck('1') }
    it { should contain_yumrepo('google-chrome').with_gpgkey('file:///etc/pki/rpm-gpg/RPM-GPG-KEY-google-chrome') }
    it { should contain_yumrepo('google-chrome').with_proxy('absent') }
    it { should contain_gpg_key('google-chrome').with_path('/etc/pki/rpm-gpg/RPM-GPG-KEY-google-chrome') }
  end

  context 'Fedora with no parameters, 32 bit' do
    let(:facts) {{ :osfamily => 'RedHat', :operatingsystem => 'Fedora', :architecture => 'i386', }}
    it { should contain_yumrepo('google-chrome').with_baseurl('http://dl.google.com/linux/chrome/rpm/stable/i386') }
    it { should contain_yumrepo('google-chrome').with_descr('Google Chrome YUM repository') }
    it { should contain_yumrepo('google-chrome').with_enabled('1') }
    it { should contain_yumrepo('google-chrome').with_gpgcheck('1') }
    it { should contain_yumrepo('google-chrome').with_gpgkey('file:///etc/pki/rpm-gpg/RPM-GPG-KEY-google-chrome') }
    it { should contain_yumrepo('google-chrome').with_proxy('absent') }
    it { should contain_gpg_key('google-chrome').with_path('/etc/pki/rpm-gpg/RPM-GPG-KEY-google-chrome') }
  end

  context 'Fedora with repo baseurl set' do
    let(:facts) {{ :osfamily => 'RedHat', :operatingsystem => 'Fedora', :architecture => 'x86_64', }}
    let(:params) {{ 'chromerepo_baseurl' => 'http://mirror.domain.com' }}
    it { should contain_yumrepo('google-chrome').with_baseurl('http://mirror.domain.com') }
  end

  context 'Fedora with repo description set' do
    let(:facts) {{ :osfamily => 'RedHat', :operatingsystem => 'Fedora', :architecture => 'x86_64', }}
    let(:params) {{ 'chromerepo_descr' => 'This is a description' }}
    it { should contain_yumrepo('google-chrome').with_descr('This is a description') }
  end

  context 'Fedora with repo enabled set' do
    let(:facts) {{ :osfamily => 'RedHat', :operatingsystem => 'Fedora', :architecture => 'x86_64', }}
    let(:params) {{ :chromerepo_enabled => '1' }}
    it { should contain_yumrepo('google-chrome').with_enabled('1') }
  end

  context 'Fedora with repo gpgcheck set' do
    let(:facts) {{ :osfamily => 'RedHat', :operatingsystem => 'Fedora', :architecture => 'x86_64', }}
    let(:params) {{ :chromerepo_gpgcheck => '1' }}
    it { should contain_yumrepo('google-chrome').with_gpgcheck('1') }
  end

  context 'Fedora with repo name set' do
    let(:facts) {{ :osfamily => 'RedHat', :operatingsystem => 'Fedora', :architecture => 'x86_64', }}
    let(:params) {{ :chromerepo_name => 'The official Google Chrome repository' }}
    it { should contain_yumrepo('The official Google Chrome repository') }
  end

  context 'Fedora with repo proxy set' do
    let(:facts) {{ :osfamily => 'RedHat', :operatingsystem => 'Fedora', :architecture => 'x86_64', }}
    let(:params) {{ :chromerepo_proxy => 'http://proxy.domain.com' }}
    it { should contain_yumrepo('google-chrome').with_proxy('http://proxy.domain.com') }
  end

  context 'Ubuntu with no parameters' do
    let(:facts) {{ :lsbdistid => 'ubuntu', :lsbdistcodename => 'trusty', :osfamily => 'Debian', :architecture => 'x86_64', }}
    it { should contain_class('apt') }
    it { should contain_apt__source('google-chrome').with_location('http://dl.google.com/linux/chrome/deb/') }
    it { should contain_apt__source('google-chrome').with_release('stable') }
    it { should contain_apt__source('google-chrome').with_repos('main') }
    it { should contain_apt__source('google-chrome').with_include_src(false) }
    it { should contain_apt__source('google-chrome').with_key('7FAC5991') }
    it { should contain_apt__source('google-chrome').with_key_source('http://dl-ssl.google.com/linux/linux_signing_key.pub') }
  end

  context 'Ubuntu with location set' do
    let(:facts) {{ :lsbdistid => 'ubuntu', :lsbdistcodename => 'trusty', :osfamily => 'Debian', :architecture => 'x86_64', }}
    let(:params) {{ 'chromerepo_location' => 'http://mirror.domain.com' }}
    it { should contain_apt__source('google-chrome').with_location('http://mirror.domain.com') }
  end

  context 'Ubuntu with release set' do
    let(:facts) {{ :lsbdistid => 'ubuntu', :lsbdistcodename => 'trusty', :osfamily => 'Debian', :architecture => 'x86_64', }}
    let(:params) {{ :chromerepo_release => 'other' }}
    it { should contain_apt__source('google-chrome').with_release('other') }
  end

  context 'Ubuntu with repos set' do
    let(:facts) {{ :lsbdistid => 'ubuntu', :lsbdistcodename => 'trusty', :osfamily => 'Debian', :architecture => 'x86_64', }}
    let(:params) {{ :chromerepo_repos => 'contrib' }}
    it { should contain_apt__source('google-chrome').with_repos('contrib') }
  end

  context 'Ubuntu with key set' do
    let(:facts) {{ :lsbdistid => 'ubuntu', :lsbdistcodename => 'trusty', :osfamily => 'Debian', :architecture => 'x86_64', }}
    let(:params) {{ :chromerepo_key => 'A1234567' }}
    it { should contain_apt__source('google-chrome').with_key('A1234567') }
  end

  context 'Ubuntu with key_source set' do
    let(:facts) {{ :lsbdistid => 'ubuntu', :lsbdistcodename => 'trusty', :osfamily => 'Debian', :architecture => 'x86_64', }}
    let(:params) {{ :chromerepo_key_source => 'http://keysource.server.domain/key.pub' }}
    it { should contain_apt__source('google-chrome').with_key_source('http://keysource.server.domain/key.pub') }
  end

  context 'Ubuntu with include_src set to true' do
    let(:facts) {{ :lsbdistid => 'ubuntu', :lsbdistcodename => 'trusty', :osfamily => 'Debian', :architecture => 'x86_64', }}
    let(:params) {{ :chromerepo_include_src => true }}
    it { should contain_apt__source('google-chrome').with_include_src(true) }
  end

  context 'Unsupported osfamily' do
    let(:facts) {{ :osfamily => 'Gentoo', :operatingsystem => 'Gentoo', :architecture => 'x86_64', }}
    it { should compile.with_all_deps }
  end
end
