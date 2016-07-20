control "9-1-2" do
  impact 1
  title "9.1.2 Verify Permissions on /etc/passwd (Not Scored)"
  desc "The /etc/passwd file contains user account information that is used by many system utilities and therefore must be readable for these utilities to operate."
  describe file('/etc/passwd') do
    it { should exist }
    it { should be_owned_by 'root' }
    its('mode') { should eq 0644 }
  end    
end 

control "9-1-3" do
  impact 1
  title "9.1.3 Verify Permissions on /etc/shadow (Scored)"
  desc "The /etc/shadow file is used to store the information about user accounts that is critical to the security of those accounts, such as the hashed password and other security information."
  describe file('/etc/shadow') do
    it { should exist }
    it { should be_owned_by 'root' }
    its('mode') { should eq 0000 }
  end
end

control "9-1-4" do
  impact 1
  title "9.1.4 Verify Permissions on /etc/gshadow (Scored)"
  desc "The /etc/gshadow file contains information about group accounts that is critical to the security of those accounts, such as the hashed password and other security information."
  describe file('/etc/gshadow') do
      it { should exist }
      it { should be_owned_by 'root' } 
      its('mode') { should eq 0000 }
  end
end
        
control "9-1-5" do
  impact 1
  title "9.1.5 Verify Permissions on /etc/group (Scored)"
  desc "The /etc/group file contains a list of all the valid groups defined in the system. The command below allows read/write access for root and read access for everyone else."
  describe file('/etc/group') do
    it { should exist }
    it { should be_owned_by 'root' }
    its('mode') { should eq 0644 }
  end
end
      
control "9-1-6" do
  impact 1
  title "9.1.6 Verify User/Group Ownership on /etc/passwd"
  desc "The /etc/passwd file contains a list of all the valid userIDs defined in the system, but not the passwords. The command below sets the owner and group of the file to root."
  describe file('/etc/passwd') do
    it { should  be_owned_by 'root' }
    its('group') { should eq 'root' }
    its('owner') { should eq 'root' }
  end
end

control "9-1-7" do
  impact 1
  title "9.1.7 Verify User/Group Ownership on /etc/shadow"
  desc "The /etc/shadow file contains the one-way cipher text passwords for each user defined in the /etc/passwd file. The command below sets the user and group ownership of the file to root."
  describe file('/etc/shadow') do
    it { should  be_owned_by 'root' }
    its('group') { should eq 'root' }
    its('owner') { should eq 'root' }
  end
end

control "9-1-8" do
  impact 1
  title "9.1.8 Verify User/Group Ownership on /etc/gshadow"
  desc "The /etc/gshadow file contains information about group accounts that is critical to the security of those accounts, such as the hashed password and other security information."
  describe file('/etc/gshadow') do
    it { should  be_owned_by 'root' }
    its('group') { should eq 'root' }
    its('owner') { should eq 'root' }
  end
end
 
control "9-1-9" do
  impact 1
  title "9.1.9 Verify User/Group Ownership on /etc/group"
  desc "The /etc/group file contains a list of all the valid groups defined in the system. The command below allows read/write access for root and read access for everyone else."
  describe file('/etc/group') do
    it { should  be_owned_by 'root' }
    its('group') { should eq 'root' }
    its('owner') { should eq 'root' }
  end
end

control "9-2-5" do
  impact 1
  title "9.2.5 Verify No UID 0 Accounts Exist Other Than root"
  desc "This access must be limited to only the default root account and only from the system console. Administrative access must be through an unprivileged account using an approved mechanism as noted in Item 7.5 Restrict root Login to System Console."
  describe passwd.uids(0) do
    its('users') { should cmp 'root' }
    its('count') { should eq 1 }
  end  
end

control "9-2-14" do
  impact 1
  title "9.2.14 Check for Duplicate UIDs"
  desc "Although the useradd program will not let you create a duplicate User ID (UID), it is possible for an administrator to manually edit the /etc/passwd file and change the UID field."
  # describe passwd.uid do
  # its('users') { should_not contain_duplicates }
  # end
end

# from Inspec CIS
#   describe passwd.where { user =~ /.*/ }.uids do
#     its("length") { should_not eq 0 }
#   end
#   a = passwd.where { user =~ /.*/ }.uids.uniq.length
#   describe passwd.where { user =~ /.*/ }.uids do
#     its("length") { should cmp == a }
#   end
# end