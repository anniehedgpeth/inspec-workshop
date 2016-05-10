control "cis-1-2-1" do                      # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "1.2.1 Verify CentOS GPG Key is Installed (Scored)"# A human-readable title
  desc "CentOS cryptographically signs updates with a GPG key to verify that they are valid."
  describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do
   its('stdout') { should match /CentOS 6 Official Signing Key/}
  end
end

