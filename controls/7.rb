control "7-1-1" do
    impact 1
    title "7.1.1 Set Password Expiration Days (Scored)"
    desc "The PASS_MAX_DAYS parameter in /etc/login.defs allows an administrator to force passwords to expire once they reach a defined age. It is recommended that the PASS_MAX_DAYS parameter be set to less than or equal to 90 days."
    describe login_defs do
      its('PASS_MAX_DAYS') { should eq '90' }
    end
end

control "7-1-2" do
    impact 1
    title "7.1.2 Set Password Change Minimum Number of Days (Scored)"
    desc "The PASS_MIN_DAYS parameter in /etc/login.defs allows an administrator to prevent users from changing their password until a minimum number of days have passed since the last time the user changed their password. It is recommended that PASS_MIN_DAYS parameter be set to 7 or more days."
    describe login_defs do
      its('PASS_MIN_DAYS') { should eq '7' }
    end
end

control "7-1-3" do
    impact 1
    title "7.1.3 Set Password Expiring Warning Days (Scored)"
    desc "The PASS_WARN_AGE parameter in /etc/login.defs allows an administrator to notify users that their password will expire in a defined number of days. It is recommended that the PASS_WARN_AGE parameter be set to 7 or more days."
    describe login_defs do
      its('PASS_WARN_AGE') { should eq '7' }
    end
end

control "7-3" do
    impact 1
    title "7.3 Set Default Group for root Account (Scored)"
    desc "The usermod command can be used to specify which group the root user belongs to. This affects permissions of files that are created by the root user."
    describe file('/etc/passwd') do
      its('content') { should match 'root:x:0:0:root:/root:/bin/bash' }
    end
end

control "7-4" do
    impact 1
    title "7.4 Set Default umask for Users (Scored)"
    desc "The default umask determines the permissions of files created by users. The user creating the file has the discretion of making their files and directories readable by others via the chmod command. Users who wish to allow their files and directories to be readable by others by default may choose a different default umask by inserting the umask command into the standard shell configuration files (.profile, .cshrc, etc.) in their home directories."
    describe file('/etc/bashrc') do
        its('content') { should match /umask 077/ }
    end
end    