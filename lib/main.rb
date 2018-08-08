require 'yaml'

require_relative 'local_ip'
require_relative 'notify'

require_relative '../config/notify'

# TreasonIp
module TreasonIp
  # @return [NilCLass]
  def self.main
    config_filename = "#{__dir__}/../config/last_ip.yaml"
    config = YAML.load_file config_filename
    last_ip = config[:last_ip]

    if last_ip != local_ip
      File.write config_filename, { last_ip: local_ip }.to_yaml
      notify Notify::CREDENTIALS, local_ip
    end
  end
end
