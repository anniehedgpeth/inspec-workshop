control "cis-2-1-1" do
  impact 1.0
  title "2.1.1 Remove telnet-server (Scored)"
  desc "The telnet package contains the telnet client, which allows users to start connections to other systems via the telnet protocol."
  describe command("rpm -q telnet-server") do
    its('stdout') { should match /package telnet-server is not installed/ }
  end  
end

control "cis-2-1-2" do
  impact 1.0
  title "2.1.2 Remove telnet Clients (Scored)"
  desc "The telnet package contains the telnet client, which allows users to start connections to other systems via the telnet protocol."
  describe command("rpm -q telnet") do
    its('stdout') { should match /package telnet is not installed/ }
  end  
end