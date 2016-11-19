class telldus::install(
  $package = $telldus::package
) {

  package { $package:
    ensure => installed
  }
}
