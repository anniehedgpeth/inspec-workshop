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
    desc "7.1.3 Set Password Expiring Warning Days (Scored)"
    title "The PASS_WARN_AGE parameter in /etc/login.defs allows an administrator to notify users that their password will expire in a defined number of days. It is recommended that the PASS_WARN_AGE parameter be set to 7 or more days."
    describe login_defs do
      its('PASS_WARN_AGE') { should eq '7' }
    end
end


#control "7-3" do
# control "7-4" do