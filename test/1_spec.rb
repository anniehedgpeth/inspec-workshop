control "cis-1-2-1" do                      
  impact 1.0                                
  title "1.2.1 Verify CentOS GPG Key is Installed (Scored)"
  desc "CentOS cryptographically signs updates with a GPG key to verify that they are valid."
  describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do
   its('stdout') { should match /CentOS 6 Official Signing Key/}
  end
end

control "cis-1-2-2" do
  impact 1.0
  title "1.2.2 Verify that gpgcheck is Globally Activated (Scored)"
  desc "The gpgcheck option, found in the main section of the /etc/yum.conf file determines if an RPM package's signature is always checked prior to its installation."
  describe file('/etc/yum.conf') do
    its('content') { should match /gpgcheck=1/ }
  end
end

control "cis-1-5-1" do
  impact 1.0
  title "1.5.1 Set User/Group Owner on /etc/grub.conf (Scored)"
  desc "Set the owner and group of /etc/grub.conf to the root user."
  describe command('stat -L -c "%u %g" /etc/grub.conf | egrep "0 0"') do
   its('stdout') { should match /0 0/}
  end
end