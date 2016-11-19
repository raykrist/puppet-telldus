# telldus::config
class telldus::config(
  $conf_file      = $telldus::conf_file,
  $user           = $telldus::user,
  $group          = $telldus::group,
  $device_node    = $telldus::device_node,
  $ignoreCtrlConf = $telldus::ignoreCtrlConf,
  $devices        = $telldus::fin_devices,
  $use_cron       = $telldus::use_cron
) {

  file { $conf_file:
    ensure  => present,
    owner   => 'root',
    group   => $group,
    mode    => '0664',
    content => template("${module_name}/tellstick.conf.erb"),
    notify  => Class['telldus::service']
  }

  if ($use_cron) {
    create_resources('telldus::cronjob', $devices)
  }
}
