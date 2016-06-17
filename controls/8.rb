control "8-1" do
    impact 1
    title "8.1 Set Warning Banner for Standard Login Services (Scored)"
    desc "The contents of the /etc/issue file are displayed prior to the login prompt on the system's console and serial devices, and also prior to logins via telnet. The contents of the /etc/motd file is generally displayed after all successful logins, no matter where the user is logging in from, but is thought to be less useful because it only provides notification to the user after the machine has been accessed."
    describe file('/etc/motd') do
        it { should be_owned_by 'root' }
    end
end 

#control "8-2" do