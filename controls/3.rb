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

control "cis-3-7" do
  impact 1.0
  title "3.7 Remove LDAP (Not Scored)"
  desc "The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP. It is a service that provides a method for looking up information from a central database. The default client/server LDAP application for CentOS is OpenLDAP." 
  describe package('openldap-servers') do
    it { should_not be_installed }
  end
  describe package('openldap-clients') do
    it { should_not be_installed }
  end
end

control "cis-3-8" do
  impact 1.0
  title "3.8 Disable NFS and RPC (Not Scored)"
  desc "The Network File System (NFS) is one of the first and most widely distributed file systems in the UNIX environment. It provides the ability for systems to mount file systems of other servers through the network." 
  desc "The Dynamic Host Configuration Protocol (DHCP) is a service that allows machines to be dynamically assigned IP addresses." 
  describe service('NFS') do
    it { should_not be_enabled }
  end
  describe service('RPC') do
    it { should_not be_enabled }
  end
end

control "cis-3-9" do
  impact 1.0
  title "3.9 Remove DNS Server (Not Scored)"
  desc "The Domain Name System (DNS) is a hierarchical naming system that maps names to IP addresses for computers, services and other resources connected to a network." 
  describe service('DNS') do
    it { should_not be_installed }
  end
end

control "cis-3-10" do
  impact 1.0
  title "3.10 Remove FTP Server (Not Scored)"
  desc "The File Transfer Protocol (FTP) provides networked computers with the ability to transfer files." 
  describe service('FTP') do
    it { should_not be_installed }
  end
end

control "cis-3-11" do
  impact 1.0
  title "3.11 Remove HTTP Server (Not Scored)"
  desc "HTTP or web servers provide the ability to host web site content. The default HTTP server shipped with CentOS Linux is Apache." 
  describe service('HTTP') do
    it { should_not be_installed }
  end
end

control "cis-3-12" do
  impact 1.0
  title "3.12 Remove Dovecot (IMAP and POP3 services) (Not Scored)"
  desc "Unless POP3 and/or IMAP servers are to be provided to this server, it is recommended that the service be deleted to reduce the potential attack surface." 
  describe service('Dovecot') do
    it { should_not be_installed }
  end
end

control "cis-3-13" do
  impact 1.0
  title "3.13 Remove Samba (Not Scored)"
  desc "The Samba daemon allows system administrators to configure their Linux systems to share file systems and directories with Windows desktops. Samba will advertise the file systems and directories via the Server Message Block (SMB) protocol. Windows desktop users will be able to mount these directories and file systems as letter drives on their systems." 
  describe service('Samba') do
    it { should_not be_installed }
  end
end

control "cis-3-14" do
  impact 1.0
  title "3.14 Remove HTTP Proxy Server (Not Scored)"
  desc "If there is no need for a proxy server, it is recommended that the squid proxy be deleted to reduce the potential attack surface." 
  describe service('squid') do
    it { should_not be_installed }
  end
end

control "cis-3-15" do
  impact 1.0
  title "3.15 Remove SNMP Server (Not Scored)"
  desc "The SNMP server communicates using SNMP v1, which transmits data in the clear and does not require authentication to execute commands. Unless absolutely necessary, it is recommended that the SNMP service not be used." 
  describe service('SNMP') do
    it { should_not be_installed }
  end
end