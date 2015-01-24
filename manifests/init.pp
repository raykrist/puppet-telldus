class telldus(
  $package = 'telldus-core',
  $conf_file = '/etc/tellstick.conf',
  $ctrl_serial = "1234",
  $user = 'nobody',
  $group = 'plugdev',
  $device_node = '/dev/tellstick',
  $ignoreCtrlConf = "false",
  $devices = hiera_hash('telldus::devices')
) {

  class { 'telldus::install': } ->
  class { 'telldus::config': }

}
