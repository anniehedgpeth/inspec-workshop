control "cis-3-1" do
  impact 1.0
  title "3.1 Set Daemon umask (Scored)"
  desc "Set the default umask for all processes started at boot time. The settings in umask selectively turn off default permission when a file is created by a daemon process." 
  describe file('/etc/sysconfig/init') do
    its('content') { should match /umask 027/ }
  end
end

control "cis-3-2" do
  impact 1.0
  title "3.2 Remove X Windows (Scored)"
  desc "The X Windows system provides a Graphical User Interface (GUI) where users can have multiple windows in which to run programs and various add on. The X Windows system is typically used on desktops where users login, but not on servers where users typically do not login." 
  describe file('/etc/inittab') do
    its('content') { should match /id:3:initdefault/ }
  end
  describe package('X Window System') do
    it { should_not be_installed }
  end
end

control "cis-3-3" do
  impact 1.0
  title "3.3 Disable Avahi Server (Scored)"
  desc "Avahi is a free zeroconf implementation, including a system for multicast DNS/DNS-SD service discovery. Avahi allows programs to publish and discover services and hosts running on a local network with no specific configuration. For example, a user can plug a computer into a network and Avahi automatically finds printers to print to, files to look at and people to talk to, as well as network services running on the machine." 
  describe service('avahi') do
    it { should_not be_enabled }
  end
end

control "cis-3-4" do
  impact 1.0
  title "3.4 Disable Print Server - CUPS (Not Scored)"
  desc "The Common Unix Print System (CUPS) provides the ability to print to both local and network printers. A system running CUPS can also accept print jobs from remote systems and print them to local printers. It also provides a web based remote administration capability." 
  describe service('CUPS') do
    it { should_not be_enabled }
  end
end

control "cis-3-5" do
  impact 1.0
  title "3.5 Remove DHCP Server (Scored)"
  desc "The Dynamic Host Configuration Protocol (DHCP) is a service that allows machines to be dynamically assigned IP addresses." 
  describe service('DHCP') do
    it { should_not be_enabled }
  end
end

control "cis-3-6" do
  impact 1.0
  title "3.6 Configure Network Time Protocol (NTP) (Scored)"
  desc "The Network Time Protocol (NTP) is designed to synchronize system clocks across a variety of systems and use a source that is highly accurate. The version of NTP delivered with CentOS can be found at http://www.ntp.org. NTP can be configured to be a client and/or a server." 
  describe ntp_conf do
    its('server') { should_not eq nil }
    its('restrict') { should include '-6 default kod nomodify notrap nopeer noquery'}
  end
  describe file('/etc/sysconfig/ntpd') do
    its('content') { should match /OPTIONS="-u ntp:ntp -p \/var\/run\/ntpd.pid.*"/ }
  end
end
