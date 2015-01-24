define telldus::cronjob(
  $id,
  $start = {},
  $stop = {},
  $user = root,
  $model = undef,
  $protocol = under,
  $parameters = undef,
) {

  # Start
  unless empty($start) {
    cron {"${name}_start":
      user => $user,
      ensure => has_key($start, 'ensure')? { true => $start[ensure], default => present },
      minute => has_key($start, 'min')? { true => $start[min], default => undef },
      hour => has_key($start, 'hour')? { true => $start[hour], default => undef },
      weekday => has_key($start, 'day')? { true => $start[day], default => undef },
      command => "/usr/bin/tdtool -n ${id}"
    }
  }

  # Stop
  unless empty($stop) {
    cron {"${name}_stop":
      user => $user,
      ensure => has_key($stop, 'ensure')? { true => $stop[ensure], default => present },
      minute => has_key($stop, 'min')? { true => $stop[min], default => undef },
      hour => has_key($stop, 'hour')? { true => $stop[hour], default => undef },
      weekday => has_key($stop, 'day')? { true => $stop[day], default => undef },
      command => "/usr/bin/tdtool -f ${id}"
    }
  }

}
