control "cis-6-1-2" do
  impact 1.0
  title "6.1.2 Enable crond Daemon (Scored)"
  desc "The crond daemon is used to execute batch jobs on the system." 
  describe service('crond') do
    it { should be_enabled }
  end
end
