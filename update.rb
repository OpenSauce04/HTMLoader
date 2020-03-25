require 'git'
require 'fileutils'
puts "Removing old apps..."
FileUtils.rm_rf("HTMLoader-apps")
FileUtils.rm_rf("apps")
puts "Downloading..."
Git.clone("https://github.com/Daniel-Bradbury/HTMLoader-apps.git","HTMLoader-apps", :branch => "better-download")
Dir.chdir "HTMLoader-apps"
urlsf=File.open('appurls.txt')
urls=urlsf.read
urlsf.close()
urls.gsub!(/\r\n?/, "\n")
urls.each_line do |line|
    Git.clone(line.chomp,File.basename(line.chomp,".git"))
end
puts "Preparing patch..."
File.delete("appurls.txt")
Dir.chdir "../"
FileUtils.mv("HTMLoader-apps", "apps")
FileUtils.rm_rf("apps/.git")
system("ruby patch.rb")
puts "Finishing update..."
FileUtils.rm_rf("apps")
File.rename("patched", "apps")