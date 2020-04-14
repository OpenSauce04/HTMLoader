require 'webrick'
require 'launchy'
server = WEBrick::HTTPServer.new :Port => 8000
server.mount "/", WEBrick::HTTPServlet::FileHandler, './'
trap('INT') { server.stop }
if ARGV[0]=="--connect"
  Launchy.open("http://localhost:8000")
end
server.start