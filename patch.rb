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
	file = File.open("./patched/#{i}/NAME", "w")
	file.print "#{app}"
	STDOUT.flush();
	file.close
end