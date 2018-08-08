require_relative 'lib/main'

task(:default) {}

desc 'Treason IP'
task(:treason_ip) { TreasonIp.main }

namespace :debug do
  desc 'Reset Last IP'
  task(:reset_last_ip) { File.write 'config/last_ip.yaml', ':last_ip: 127.0.0.1' }
end
