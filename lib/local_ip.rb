require 'socket'

# TreasonIp
module TreasonIp
  # @return [String]
  def self.local_ip
    # save global do_not_reverse_lookup flag
    original = Socket.do_not_reverse_lookup

    # set global do_not_reverse_lookup flag to true
    Socket.do_not_reverse_lookup = true

    # open UDP socket
    # return last IP address
    UDPSocket.open do |s|
      # try connect to Google DNS, for example
      s.connect('8.8.8.8', 1)
      s.addr.last
    end
  ensure
    # recovery global do_not_reverse_lookup flag
    Socket.do_not_reverse_lookup = original
  end
end