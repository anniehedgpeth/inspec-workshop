control "cis-4-1-1" do
 impact 1.0
 title "4.1.1 Disable IP Forwarding (Scored)"
 desc "Setting the flag to 0 ensures that a server with multiple interfaces (for example, a hard #proxy), will never be able to forward packets, and therefore, never serve as a router." 
 describe kernel_parameter('net.ipv4.ip_forward') do
   its('value') { should eq 0 }
 end
end  

control "cis-4-1-2" do
 impact 1.0
 title "4.1.2 Disable Send Packet Redirects (Scored)"
 desc "An attacker could use a compromised host to send invalid ICMP redirects to other router #devices in an attempt to corrupt routing and have users access a system set up by the attacker as #opposed to a valid system." 
 describe kernel_parameter('net.ipv4.conf.all.send_redirects') do
   its('value') { should eq 0 }
 end
 describe kernel_parameter('net.ipv4.conf.default.send_redirects') do
   its('value') { should eq 0 }
 end
end

control "cis-4-2-1" do
 impact 1.0
 title "4.2.1 Disable Source Routed Packet Acceptance (Scored)"
 desc "Settingnet.ipv4.conf.all.accept_source_route and net.ipv4.conf.default.accept_source_route #to 0 disables the system from accepting source routed packets. Assume this server was capable of #routing packets to Internet routable addresses on one interface and private addresses on another #interface. Assume that the private addresses were not routable to the Internet routable addresses #and vice versa. Under normal routing circumstances, an attacker from the Internet routable #addresses could not use the server as a way to reach the private address servers. If, however, source routed packets were allowed, they could be used to gain access to the private address #systems as the route could be specified, rather than rely on routing protocols that did not allow #this routing." 
 describe kernel_parameter('net.ipv4.conf.all.accept_source_route') do
   its('value') { should eq 0 }
 end
 describe kernel_parameter('net.ipv4.conf.default.accept_source_route') do
 its('value') { should eq 0 }
 end
end

control "cis-4-2-2" do
 impact 1.0
 title "4.2.2 Disable ICMP Redirect Acceptance (Scored)"
 desc "Attackers could use bogus ICMP redirect messages to maliciously alter the system routing #tables and get them to send packets to incorrect networks and allow your system packets to be #captured." 
 describe kernel_parameter('net.ipv4.conf.all.accept_redirects') do
   its('value') { should eq 0 }
 end
 describe kernel_parameter('net.ipv4.conf.default.accept_redirects') do
   its('value') { should eq 0 }
 end
end

control "cis-4-2-3" do
 impact 1.0
 title "4.2.3 Disable Secure ICMP Redirect Acceptance (Scored)"
 desc "It is still possible for even known gateways to be compromised. Setting #net.ipv4.conf.all.secure_redirects to 0 protects the system from routing table updates by #possibly compromised known gateways." 
 describe kernel_parameter('net.ipv4.conf.all.secure_redirects') do
   its('value') { should eq 0 }
 end
 describe kernel_parameter('net.ipv4.conf.default.secure_redirects') do
   its('value') { should eq 0 }
 end
end

control "cis-4-2-4" do
 impact 1.0
 title "4.2.4 Log Suspicious Packets (Scored)"
 desc "Enabling this feature and logging these packets allows an administrator to investigate the #possibility that an attacker is sending spoofed packets to their server." 
 describe kernel_parameter('net.ipv4.conf.all.log_martians') do
   its('value') { should eq 1 }
 end
 describe kernel_parameter('net.ipv4.conf.default.log_martians') do
 its('value') { should eq 1 }
 end
end

control "cis-4-2-5" do
 impact 1.0
 title "4.2.5 Enable Ignore Broadcast Requests (Scored)"
 desc "Accepting ICMP echo and timestamp requests with broadcast or multicast destinations for #your network could be used to trick your host into starting (or participating) in a Smurf attack. #A Smurf attack relies on an attacker sending large amounts of ICMP broadcast messages with a #spoofed source address. All hosts receiving this message and responding would send echo-reply #messages back to the spoofed address, which is probably not routable. If many hosts respond to #the packets, the amount of traffic on the network could be significantly multiplied." 
 describe kernel_parameter('net.ipv4.icmp_echo_ignore_broadcasts') do
   its('value') { should eq 1 }
 end
end

control "cis-4-5-1" do
  impact 1.0
  title "4.5.1 Install TCP Wrappers (Not Scored)"
  desc "TCP Wrappers provide a good simple access list mechanism to services that may not have hat #support built in. It is recommended that all services that can support TCP Wrappers, use it." 
  describe package('tcp_wrappers') do
    it { should be_installed }
  end
end

control "cis-4-5-2" do
 impact 1.0
 title "4.5.2 Create /etc/hosts.allow (Not Scored)"
 desc "The /etc/hosts.allow file supports access control by IP and helps ensure that only #authorized systems can connect to the server." 
 describe file('/etc/hosts.allow') do
   it { should exist }
 end
end

control "cis-4-5-3" do
 impact 1.0
 title "4.5.3 Verify Permissions on /etc/hosts.allow (Scored)"
  desc "It is critical to ensure that the /etc/hosts.allow file is protected from unauthorized write access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions." 
  describe file('/etc/hosts.allow') do
    its('owner') { should eq 'root' }
  end
  describe file('/etc/hosts.allow') do
    its('mode') { should eq 0644 }
  end
  describe file('/etc/hosts.allow') do
    its('mode') { should cmp 0644 }  end
  describe file("/etc/hosts.allow") do
    it { should exist }
    it { should_not be_executable.by "group" }
    it { should be_readable.by "group" }
    it { should_not be_writable.by "group" }
    it { should_not be_executable.by "other" }
    it { should be_readable.by "other" }
    it { should_not be_writable.by "other" }
    it { should_not be_executable.by "owner" }
    it { should be_readable.by "owner" }
    it { should be_writable.by "owner" }
  end
end

control "cis-4-5-4" do
  impact 1.0
  title "4.5.4 Create /etc/hosts.deny (Not Scored)"
  desc "The /etc/hosts.deny file serves as a failsafe so that any host not specified in /etc/hosts.allow is denied access to the server." 
  describe file('/etc/hosts.deny') do
    it { should exist }
  end
end

control "cis-4-5-5" do
  impact 1.0
  title "4.5.5 Verify Permissions on /etc/hosts.deny (Scored)"
  desc "It is critical to ensure that the /etc/hosts.deny file is protected from unauthorized write access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions." 
  describe file('/etc/hosts.deny') do
    its('owner') { should eq 'root' }
    it { should exist }
  end
end

control "cis-4-7" do
  impact 1.0
  title "4.7 Enable IPtables (Scored)"
  desc "IPtables provides extra protection for the Linux system by limiting communications in and out of the box to specific IPv4 addresses and ports." 
  describe service('iptables') do
    it { should be_enabled }
  end
end