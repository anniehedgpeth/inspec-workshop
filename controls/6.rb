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
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-5" do
  impact 1.0
  title "6.1.5 Set User/Group Owner and Permission on /etc/cron.hourly (Scored)"
  desc "This directory contains system cron jobs that need to run on an hourly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.hourly') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-6" do
  impact 1.0
  title "6.1.6 Set User/Group Owner and Permission on /etc/cron.daily (Scored)"
  desc "The /etc/cron.daily directory contains system cron jobs that need to run on a daily basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.daily') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-7" do
  impact 1.0
  title "6.1.7 Set User/Group Owner and Permission on /etc/cron.weekly (Scored)"
  desc "The /etc/cron.weekly directory contains system cron jobs that need to run on a weekly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.weekly') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-8" do
  impact 1.0
  title "6.1.8 Set User/Group Owner and Permission on /etc/cron.monthly (Scored)"
  desc "The /etc/cron.monthly directory contains system cron jobs that need to run on a monthly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.monthly') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-9" do
  impact 1.0
  title "6.1.9 Set User/Group Owner and Permission on /etc/cron.d (Scored)"
  desc "TThe /etc/cron.d directory contains system cron jobs that need to run in a similar manner to the hourly, daily weekly and monthly jobs from /etc/crontab, but require more granular control as to when they run. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.d') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "6-2-1" do
    impact 1
    title "6.2.1 Set SSH Protocol to 2 (Scored)"
    desc "SSH supports two different and incompatible protocols: SSH1 and SSH2. SSH1 was the original protocol and was subject to security issues. SSH2 is more advanced and secure."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match 'Protocol 2'}
    end
end

control "6-2-2" do
    impact 1
    title "6.2.2 Set LogLevel to INFO (Scored)"
    desc "The INFO parameter specifices that record login and logout activity will be logged."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match 'LogLevel INFO'}
    end
end

control "6-2-3" do
    impact 1
    title "6.2.3 Set Permissions on /etc/ssh/sshd_config (Scored)"
    desc "The /etc/ssh/sshd_config file contains configuration specifications for sshd. The command below sets the owner and group of the file to root."
    describe file('/etc/ssh/sshd_config') do
    it { should exist }
    its('mode') {should eq 0600}
    end
end

control "6-2-4" do
    impact 1
    title "6.2.4 Disable SSH X11 Forwarding (Scored)"
    desc "The X11Forwarding parameter provides the ability to tunnel X11 traffic through the connection to enable remote graphic connections."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^X11Forwarding no'}
    end
end

control "6-2-5" do
    impact 1
    title "6.2.5 Set SSH MaxAuthTries to 4 or Less (Scored)"
    desc "The MaxAuthTries parameter specifies the maximum number of authentication attempts permitted per connection. When the login failure count reaches half the number, error messages will be written to the syslog file detailing the login failure."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^MaxAuthTries 4'}
    end
end

control "6-2-6" do
    impact 1
    title "6.2.6 Set SSH IgnoreRhosts to Yes (Scored)"
    desc "The IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication orHostbasedAuthentication."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^IgnoreRhosts yes'}
    end
end

control "6-2-7" do
    impact 1
    title "6.2.7 Set SSH HostbasedAuthentication to No (Scored)"
    desc "The HostbasedAuthentication parameter specifies if authentication is allowed through trusted hosts via the user of .rhosts, or /etc/hosts.equiv, along with successful public key client host authentication. This option only applies to SSH Protocol Version 2."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^HostbasedAuthentication no'}
    end
end

control "6-2-8" do
    impact 1
    title "6.2.8 Disable SSH Root Login (Scored)"
    desc "The PermitRootLogin parameter specifies if the root user can log in using ssh(1). The default is no."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^PermitRootLogin no'}
    end
end

control "6-2-9" do
    impact 1
    title "6.2.9 Set SSH PermitEmptyPasswords to No (Scored)"
    desc "The PermitEmptyPasswords parameter specifies if the server allows login to accounts with empty password strings."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^PermitEmptyPasswords no'}
    end
end

control "6-2-10" do
    impact 1
    title "6.2.10 Do Not Allow Users to Set Environment Options (Scored)"
    desc "The PermitUserEnvironment option allows users to present environment options to the ssh daemon."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^PermitUserEnvironment no'}
    end
end

control "6-2-11" do
    impact 1
    title "6.2.11 Use Only Approved Cipher in Counter Mode (Scored)"
    desc "This variable limits the types of ciphers that SSH can use during communication."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^Ciphers aes128-ctr,aes192-ctr,aes256-ctr'}
    end
end

control "6-2-12" do
    impact 1
    title "6.2.12 Set Idle Timeout Interval for User Login (Scored)"
    desc "The two options ClientAliveInterval and ClientAliveCountMax control the timeout of ssh sessions. When the ClientAliveInterval variable is set, ssh sessions that have no activity for the specified length of time are terminated. When the ClientAliveCountMax variable is set, sshd will send client alive messages at every ClientAliveInterval interval. When the number of consecutive client alive messages are sent with no response from the client, the ssh session is terminated. For example, if the ClientAliveInterval is set to 15 seconds and the ClientAliveCountMax is set to 3, the client ssh session will be terminated after 45 seconds of idle time."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^ClientAliveInterval 300'}
      its ('content')  {should match '^ClientAliveCountMax 0'}
    end
end

control "6-2-13" do
    impact 1
    title "6.2.13 Limit Access via SSH (Scored)"
    desc "Restricting which users can remotely access the system via SSH will help ensure that only authorized users access the system."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^AllowUsers <userlist>'}
      its ('content')  {should match '^DenyUsers <userlist>'}
      its ('content')  {should match '^DenyGroups <grouplist>'}
      its ('content')  {should match '^AllowGroups <grouplist>'}
    end
end

control "6-2-14" do
    impact 1
    title "6.2.14 Set SSH Banner (Scored)"
    desc "The Banner parameter specifies a file whose contents must be sent to the remote user before authentication is permitted. By default, no banner is displayed."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^Banner /etc/issue.net'}
    end
end

control "6-3-1" do
    impact 1
    title "6.3.1 Upgrade Password Hashing Algorithm to SHA-512 (Scored)"
    desc "The commands below change password encryption from md5 to sha512 (a much stronger hashing algorithm). All existing accounts will need to perform a password change to upgrade the stored hashes to the new algorithm."
    describe command('authconfig --test | grep hashing | grep sha512') do
      its('stdout') { should match (/sha512/) }
    end
end

control "6-3-2" do
    impact 1
    title "6.3.2 Set Password Creation Requirement Parameters Using pam_cracklib (Scored)"
    desc "Strong passwords protect systems from being hacked through brute force methods."
    describe file('/etc/pam.d/system-auth') do
      its ('content')  {should match '^password required pam_cracklib.so try_first_pass retry=3 minlen=14 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1'}
    end
end


# control "6-3-3" do
#     impact 1
#     title "6.3.3 Set Lockout for Failed Password Attempts (Not Scored)"
#     desc "Lock out userIDs after n unsuccessful consecutive login attempts. The first sets of changes are made to the main PAM configuration files /etc/pam.d/system-auth and /etc/pam.d/password-auth. The second set of changes are applied to the program specific PAM configuration file (in this case, the ssh daemon). The second set of changes must be applied to each program that will lock out userID's."

#     end
# end

# control "6-3-4" do
#     impact 1
#     title "6.2.14 Set SSH Banner (Scored)"
#     desc "The Banner parameter specifies a file whose contents must be sent to the remote user before authentication is permitted. By default, no banner is displayed."
#     describe file('/etc/ssh/sshd_config') do
#       its ('content')  {should match '^Banner /etc/issue.net'}
#     end
# end