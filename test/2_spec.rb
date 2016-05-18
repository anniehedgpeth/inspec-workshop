control "cis-2-1-1" do
  impact 1.0
  title "2.1.1 Remove telnet-server (Scored)"
  desc "The telnet package contains the telnet client, which allows users to start connections to other systems via the telnet protocol."
#  describe command("rpm -q telnet-server") do
#    its('stdout') { should match /package telnet-server is not installed/ }
#  end  
  describe package('telnet-server') do
    it { should_not be_installed }
  end
end

control "cis-2-1-2" do
  impact 1.0
  title "2.1.2 Remove telnet Clients (Scored)"
  desc "The telnet package contains the telnet client, which allows users to start connections to other systems via the telnet protocol."
#  describe command("rpm -q telnet") do
#    its('stdout') { should match /package telnet is not installed/ }
#  end  
  describe package('telnet') do
    it { should_not be_installed }
  end
end

control "cis-2-1-3" do
  impact 1.0
  title "2.1.3 Remove rsh-server (Scored)"
  desc "The Berkeley rsh-server (rsh, rlogin, rcp) package contains legacy services that exchange credentials in clear-text."
#  describe command("rpm -q rsh-server") do
#    its('stdout') { should match /package rsh-server is not installed/ }
#  end  
  describe package('rsh-server') do
    it { should_not be_installed }
  end
end

control "cis-2-1-4" do
  impact 1.0
  title "2.1.4 Remove rsh (Scored)"
  desc "The rsh package contains the client commands for the rsh services." 
  describe package('rsh') do
    it { should_not be_installed }
  end
end
