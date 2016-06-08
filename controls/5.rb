control "cis-5-1-1" do
  impact 1.0
  title "5.1.1 Install the rsyslog package (Scored)"
  desc "The security enhancements of rsyslog such as connection-oriented (i.e. TCP) transmission of logs, the option to log to database formats, and the encryption of log data en route to a central logging server) justify installing and configuring the package." 
  describe package('rsyslog') do
    it { should be_installed }
  end
end

control "cis-5-1-2" do
  impact 1.0
  title "5.1.2 Activate the rsyslog Service (Scored)"
  desc "It is important to ensure that syslog is turned off so that it does not interfere with the rsyslog service." 
  describe service('rsyslog') do
    it { should be_enabled }
  end
  describe service("syslog").runlevels(/.*/) do
    it { should be_disabled }
  end
end

control "cis-5-1-3" do
  impact 1.0
  title "5.1.3 Configure /etc/rsyslog.conf (Not Scored)"
  desc "A great deal of important security-related information is sent via rsyslog (e.g., successful and failed su attempts, failed login attempts, root login attempts, etc.)." 
end

# control "cis-5-1-4" do
#   impact 1.0
#   title "5.1.4 Create and Set Permissions on rsyslog Log Files (Scored)"
#   desc "It is important to ensure that log files exist and have the correct permissions to ensure that sensitive rsyslog data is archived and protected." 
# end

control "cis-5-2-1-1" do
  impact 1.0
  title "5.2.1.1 Configure Audit Log Storage Size (Not Scored)"
  desc "It is important that an appropriate size is determined for log files so that they do not impact the system and audit data is not lost."
  describe auditd_conf do
    its('max_log_file') { should cmp 100 }
  end  
end

control "cis-5-2-1-2" do
  impact 1.0
  title "5.2.1.2 Disable System on Audit Log Full (Not Scored)"
  desc "In high security contexts, the risk of detecting unauthorized access or nonrepudiation exceeds the benefit of the system's availability."
  describe auditd_conf do
    its('action_mail_acct') { should cmp 'root' }
    its('space_left_action') { should cmp 'email' }
    # its('admin_space_left') { should cmp 1 }
    its('admin_space_left_action') { should cmp 'halt' }
  end
end  

control "cis-5-2-1-3" do
  impact 1.0
  title "5.2.1.3 Keep All Auditing Information (Scored)"
  desc "In high security contexts, the benefits of maintaining a long audit history exceed the cost of storing the audit history."
  describe auditd_conf do
    its('max_log_file_action') { should cmp 'keep_logs' }
  end
end  