control "cis-1-2-1" do                      
  impact 1.0                                
  title "1.2.1 Verify CentOS GPG Key is Installed (Scored)"
  desc "CentOS cryptographically signs updates with a GPG key to verify that they are valid."
  describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do
   its('stdout') { should match /CentOS 6 Official Signing Key/ }
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
  describe file('/etc/grub.conf') do
    its('owner') { should eq 'root' }
    its('group') { should eq 'root'}
  end
end

control "cis-1-5-2" do
  impact 1.0
  title "1.5.2 Set Permissions on /etc/grub.conf (Scored)"
  desc "Set permission on the /etc/grub.conf file to read and write for root only."
  describe file('/etc/grub.conf') do
    it { should be_writable.by('owner') }
    it { should be_readable.by('owner') }
  end
end

control "cis-1-5-3" do
  impact 1.0
  title "1.5.3 Set Boot Loader Password (Scored)"
  desc "Setting the boot loader password will require that the person who is rebooting the must enter a password before being able to set command line boot parameters."
  describe file('/etc/grub.conf') do
    its(:content) { should match /password --md5/ }
#inspec exec test/1_spec.rb -t ssh://annie@ipaddress --password 'password' --sudo-password=password --sudo
  end
end

control "cis-1-6-1" do
  impact 1.0
  title "1.6.1 Restrict Core Dumps"
  desc "A core dump is the memory of an executable program. It is generally used to determine why a program aborted. It can also be used to glean confidential information from a core file. The system provides the ability to set a soft limit for core dumps, but this can be overridden by the user."
  describe file("/etc/security/limits.conf") do
    its(:content) { should match /hard core 0/ }
  end  
  describe file("/etc/sysctl.conf") do
   its(:content) { should match /fs.suid_dumpable = 0/ }
  end
end

control "cis-1-6-3" do
  impact 1.0
  title "1.6.3 Enable Randomized Virtual Memory Region Placement (Scored)"
  desc "Set the system flag to force randomized virtual memory region placement."
  describe command("sysctl kernel.randomize_va_space") do
    its('stdout') { should match /kernel.randomize_va_space = 2/ }
  end  
end