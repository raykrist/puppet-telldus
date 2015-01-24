class telldus(
  $package = 'telldus-core',
  $service = 'telldusd',
  $service_status = 'running',
  $conf_file = '/etc/tellstick.conf',
  $ctrl_serial = "1234",
  $user = 'nobody',
  $group = 'plugdev',
  $device_node = '/dev/tellstick',
  $ignoreCtrlConf = "false",
  $use_cron = false,
  $devices = hiera_hash('telldus::devices', {})
) {

  class { 'telldus::install': } ->
  class { 'telldus::config': } ->
  class { 'telldus::service': }

}
