#
# Simple module to manage installation, configuration and running
# of telldus tellstick
#
class telldus(
  $package = 'telldus-core',
  $service = 'telldusd',
  $service_status = 'running',
  $conf_file = '/etc/tellstick.conf',
  $ctrl_serial = '1234',
  $user = 'nobody',
  $group = 'plugdev',
  $device_node = '/dev/tellstick',
  $ignoreCtrlConf = 'false',
  $use_cron = false,
  $devices = {}
) {

  class { 'telldus::install': } ->
  class { 'telldus::config': } ->
  class { 'telldus::service': }

}
