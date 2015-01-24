class telldus::service(
  $service  = $telldus::service,
  $status   = $telldus::service_status
) {

  service { $service:
    ensure => $status
  }
}
