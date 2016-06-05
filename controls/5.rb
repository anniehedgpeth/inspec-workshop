control "cis-5-1-1" do
  impact 1.0
  title "5.1.1 Install the rsyslog package (Scored)"
  desc "The security enhancements of rsyslog such as connection-oriented (i.e. TCP) transmission of logs, the option to log to database formats, and the encryption of log data en route to a central logging server) justify installing and configuring the package." 
  describe package('rsyslog') do
    it { should be_installed }
  end
end