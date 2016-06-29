control "8-1" do
    impact 1
    title "8.1 Set Warning Banner for Standard Login Services (Scored)"
    desc "The contents of the /etc/issue file are displayed prior to the login prompt on the system's console and serial devices, and also prior to logins via telnet. The contents of the /etc/motd file is generally displayed after all successful logins, no matter where the user is logging in from, but is thought to be less useful because it only provides notification to the user after the machine has been accessed."
    describe file('/etc/motd') do
        it { should exist }
        its("gid") { should cmp 0 }
        its("uid") { should cmp 0 }
        it { should be_owned_by 'root' }
        it { should_not be_executable.by "group" }
        it { should be_readable.by "group" }
        it { should_not be_writable.by "group" }
        it { should_not be_executable.by "other" }
        it { should be_readable.by "other" }
        it { should_not be_writable.by "other" }
        it { should_not be_executable.by "owner" }
        it { should be_readable.by "owner" }
        it { should be_writable.by "owner" }
    end
    describe file('/etc/issue') do
        it { should exist }
        its("gid") { should cmp 0 }
        its("uid") { should cmp 0 }
        it { should be_owned_by 'root' }
        it { should_not be_executable.by "group" }
        it { should be_readable.by "group" }
        it { should_not be_writable.by "group" }
        it { should_not be_executable.by "other" }
        it { should be_readable.by "other" }
        it { should_not be_writable.by "other" }
        it { should_not be_executable.by "owner" }
        it { should be_readable.by "owner" }
        it { should be_writable.by "owner" }    
    end
    describe file('/etc/issue.net') do
        it { should exist }
        its("gid") { should cmp 0 }
        its("uid") { should cmp 0 }
        it { should be_owned_by 'root' }
        it { should_not be_executable.by "group" }
        it { should be_readable.by "group" }
        it { should_not be_writable.by "group" }
        it { should_not be_executable.by "other" }
        it { should be_readable.by "other" }
        it { should_not be_writable.by "other" }
        it { should_not be_executable.by "owner" }
        it { should be_readable.by "owner" }
        it { should be_writable.by "owner" }
    end      
end 

control "8-2" do
    impact 1
    title "8.2 Remove OS Information from Login Warning Banners (Scored)"
    desc "Displaying OS and patch level information in login banners also has the side effect of providing detailed system information to attackers attempting to target specific exploits of a system. Authorized users can easily get this information by running the 'uname -a' command once they have logged in."
    describe file('/etc/issue') do
        its('content') { should_not match /(\\v|\\r|\\m|\\s)/ }
    end
    describe file('/etc/motd') do
        its('content') { should_not match /(\\v|\\r|\\m|\\s)/ }
    end
    describe file('/etc/issue.net') do
        its('content') { should_not match /(\\v|\\r|\\m|\\s)/ }
    end    
end 