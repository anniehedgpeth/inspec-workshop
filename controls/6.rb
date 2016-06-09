control "cis-6-1-2" do
  impact 1.0
  title "6.1.2 Enable crond Daemon (Scored)"
  desc "The crond daemon is used to execute batch jobs on the system." 
  describe service('crond') do
    it { should be_enabled }
  end
end

control "cis-6-1-4" do
  impact 1.0
  title "6.1.4 Set User/Group Owner and Permission on /etc/crontab (Scored)"
  desc "The /etc/crontab file is used by cron to control its own jobs. The commands in this item make here sure that root is the user and group owner of the file and is the only user that can read and write the file." 
  describe file('/etc/crontab') do
    its('owner') { should eq 'root' }
  end
end