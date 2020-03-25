require 'git'
require 'fileutils'
puts "Removing old apps..."
FileUtils.rm_rf("HTMLoader-apps")
FileUtils.rm_rf("apps")
puts "Downloading main repo..."
Git.clone("https://github.com/Daniel-Bradbury/HTMLoader-apps.git","HTMLoader-apps", :branch => "better-download")
Dir.chdir "HTMLoader-apps"
urlsf=File.open('appurls.txt')
urls=urlsf.read
urlsf.close()
puts "Downloading apps..."
urls.each_line do |line|
    puts "  Downloading "+line.chomp+"..."
    Git.clone(line.chomp,File.basename(line.chomp,".git"))
end
puts "Renaming folders to app name..."
namesf=File.open('appnames.txt')
names=namesf.read
namesf.close()
names.gsub!(/\r\n?/, "\n")
names.each_line do |line|
    File.rename(line.chomp.split("|")[0], line.chomp.split("|")[1]) 
end
puts "Preparing patch..."
File.delete("appurls.txt")
File.delete("appnames.txt")
Dir.chdir "../"
FileUtils.mv("HTMLoader-apps", "apps")
FileUtils.rm_rf("apps/.git")
system("ruby patch.rb")
puts "Finishing update..."
FileUtils.rm_rf("apps")
File.rename("patched", "apps")