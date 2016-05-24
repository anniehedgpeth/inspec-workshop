control "cis-3-1" do
  impact 1.0
  title "3.1 Set Daemon umask (Scored)"
  desc "Set the default umask for all processes started at boot time. The settings in umask selectively turn off default permission when a file is created by a daemon process." 
  describe file('/etc/sysconfig/init') do
    its('content') { should match /umask 027/ }
  end
end

control "cis-3-2" do
  impact 1.0
  title "3.2 Remove X Windows (Scored)"
  desc "The X Windows system provides a Graphical User Interface (GUI) where users can have multiple windows in which to run programs and various add on. The X Windows system is typically used on desktops where users login, but not on servers where users typically do not login." 
  describe file('/etc/inittab') do
    its('content') { should match /id:3:initdefault/ }
  end
  describe package('X Window System') do
    it { should_not be_installed }
  end
end