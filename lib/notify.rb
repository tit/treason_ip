require 'gmail'
require 'socket'

# TreasonIp
module TreasonIp
  # @param [NilClass] credentials
  def self.notify(credentials, local_ip)
    puts 42

    stderr_path = File.new '/dev/null', 'w'
    $stderr.reopen stderr_path

    gmail = Gmail.new credentials[:login], credentials[:password]
    gmail.deliver do
      from credentials[:from]
      to credentials[:to]
      subject "#{Socket.gethostname} IP"
      body <<-TEXT
        Now my IP: #{local_ip}
        With love, #{Socket.gethostname}
      TEXT
    end
    gmail.logout
  end
end
