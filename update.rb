require 'git'
require 'fileutils'
puts "Removing old apps..."
FileUtils.rm_rf("HTMLoader-apps")
FileUtils.rm_rf("apps")
puts "Downloading main repo..."
Git.clone("https://github.com/Daniel-Bradbury/HTMLoader-apps.git","HTMLoader-apps")
Dir.chdir "HTMLoader-apps"
urlsf=File.open('appurls.txt')
urls=urlsf.read
urlsf.close()
puts "Downloading apps..."
urls.each_line do |line|
    puts "  Downloading "+line.chomp+"..."
    Git.clone(line.chomp,File.basename(line.chomp,".git"))
end
puts "Renaming folders..."
namesf=File.open('appnames.txt')
names=namesf.read
namesf.close()
names.gsub!(/\r\n?/, "\n")
names.each_line do |line|
    File.rename(line.chomp.split("|")[0], line.chomp.split("|")[1]) 
end
puts "Setting icons..."
apps = Dir.glob('*').select {|f| File.directory? f}
apps.each do |app|
    if File.file?("_icon/"+app.chomp+".ico")
        FileUtils.mv("_icon/"+app.chomp+".ico", app.chomp+"/favicon.ico")
        puts "  "+app.chomp+".ico found."
    end
    if File.file?("_icon/"+app.chomp+".png")
        FileUtils.mv("_icon/"+app.chomp+".png", app.chomp+"/icon.png")
        puts "  "+app.chomp+".png found."
    end
end
puts "Preparing patch..."
File.delete("appurls.txt")
File.delete("appnames.txt")
FileUtils.rm_rf("_icon")
Dir.chdir "../"
FileUtils.mv("HTMLoader-apps", "apps")
FileUtils.rm_rf("apps/.git")
system("ruby module/patch.rb")
puts "Finishing..."
FileUtils.rm_rf("apps")
File.rename("patched", "apps")