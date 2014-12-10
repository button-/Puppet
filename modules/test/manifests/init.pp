class test {
  file {
    "/tmp/amb":
    ensure => file,
    source => "puppet:///modules/test/amb";
  }
}
