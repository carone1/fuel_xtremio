#
#    Copyright 2016 EMC, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#
class plugin_emc_xtremio::controller {

  include plugin_emc_xtremio::common
  include ::cinder::params

  $plugin_settings = hiera('emc_xtremio')

  if $::cinder::params::volume_package {
    package { $::cinder::params::volume_package:
      ensure => present,
    }
    Package[$::cinder::params::volume_package] -> Cinder_config<||>
  }

  $volume_type      = 'XtremIO-backend'
  $xtrem_io_section = 'XtremIO'
  $default_section  = 'DEFAULT'

  # DEFAULT Section
  cinder_config {
    "${default_section}/enabled_backends":     value => "${default_section},${xtrem_io_section}";
  }

  # XtremIO Section
  cinder_config {
    "${xtrem_io_section}/san_ip":                           value => $plugin_settings['emc_xms_ip'];
    "${xtrem_io_section}/san_login":                        value => $plugin_settings['emc_username'];
    "${xtrem_io_section}/san_password":                     value => $plugin_settings['emc_password'];
    "${xtrem_io_section}/use_multipath_for_image_xfer":     value => 'True';
    "${xtrem_io_section}/host":                             value => 'cinder';
    "${xtrem_io_section}/volume_driver":                    value => 'cinder.volume.drivers.emc.xtremio.XtremIOISCSIDriver';
    "${xtrem_io_section}/volume_backend_name":              value => $volume_type;
  }

  # Cluster name
  if $plugin_settings['emc_cluster_name'] {
    cinder_config {
      "${xtrem_io_section}/xtremio_cluster_name":           value => $plugin_settings['emc_cluster_name'];
    }
  }


  Cinder_config<||> ~> Service['cinder_volume']

  file {'cinder-volume-agent-ocf':
    path   =>'/usr/lib/ocf/resource.d/fuel/cinder-volume',
    mode   => '0755',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/plugin_emc_xtremio/ocf/cinder-volume',
    before => Service['cinder_volume'],
  }

  service { 'cinder_volume-init_stopped':
    ensure     => stopped,
    name       => $::cinder::params::volume_service,
    enable     => false,
    hasstatus  => true,
    hasrestart => true,
    before     => Service['cinder_volume'],
  }

  service { 'cinder_volume':
    ensure     => running,
    name       => "p_${::cinder::params::volume_service}",
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => 'pacemaker',
  }


  exec { "Create Cinder volume type \'${volume_type}\'":
    command => "bash -c 'source /root/openrc; cinder type-create ${volume_type}'",
    path    => ['/usr/bin', '/bin'],
    unless  => "bash -c 'source /root/openrc; cinder type-list | grep -q -w \" ${volume_type} \"'",
  } ->

  exec { "Create Cinder volume type extra specs for \'${volume_type}\'":
    command => "bash -c 'source /root/openrc; cinder type-key ${volume_type} set volume_backend_name=${volume_type}'",
    path    => ['/usr/bin', '/bin'],
    onlyif  => "bash -c 'source /root/openrc; cinder type-list | grep -q -w \" ${volume_type} \"'",
  }


}
