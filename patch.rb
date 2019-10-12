require 'fileutils'
puts "Patching apps..."
apps=Dir.entries("./apps").select {|f| !File.directory? f}
i=0
FileUtils.rm_rf("patched")
FileUtils.mkdir_p("patched")
apps.each do |app|
    puts "  #{app}"
    i+=1
    FileUtils.copy_entry("./apps/#{app}", "./patched/#{i}", preserve = false, dereference = false)
    if File.file?("./patched/#{i}/icon.png") then
    	File.rename("./patched/#{i}/icon.png", "./patched/#{i}/#{apps[i-1]}.icon.png")
	end
	file = File.open("./patched/#{i}/NAME", "w")
	file.print "#{app}"
	STDOUT.flush();
	file.close
end