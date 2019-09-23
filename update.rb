require 'fileutils'
FileUtils.rm_rf("HTMLoader-apps")
FileUtils.rm_rf("apps")
puts "Downloading..."
system("git clone https://github.com/Daniel-Bradbury/HTMLoader-apps.git")
puts "Preparing patch..."
File.rename("HTMLoader-apps", "apps")
FileUtils.rm_rf("apps/.git")
system("ruby patch.rb")
puts "Finishing update..."
FileUtils.rm_rf("apps")
File.rename("patched", "apps")