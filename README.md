EMC XtremIO Plugin for Fuel
==========================

EMC XtremIO plugin
------------------

EMC XtremIO plugin for Fuel extends Mirantis OpenStack functionality by adding
support for EMC VNX arrays in Cinder using iSCSI protocol. It replaces Cinder
LVM driver which is the default volume backend that uses local volumes
managed by LVM.

Requirements
------------

| Requirement                      | Version/Comment |
|:---------------------------------|:----------------|
| Mirantis OpenStack compatibility | 8.0             |

Limitations
-----------

Since only one storage network is available in Fuel 6.x on OpenStack nodes,
multipath will bind all storage paths from EMC on one network interface.
In case this NIC fails, the communication with storage is lost.

Installation Guide
==================


EMC XtremIO configuration
-------------------------

Before starting a deployment you have to preconfigure EMC XtremIO array and connect
it properly to the environment. Both EMC XMS IP and all iSCSI ports should be
available over storage interface from OpenStack nodes. To learn more about
EMC XtremIO configuration, see
[the official EMC XtremIO series documentation](https://support.emc.com/docu71055_XtremIO-XIOS-4.0.2,-4.0.4,-and-4.0.10-with-XMS-4.2.0-Storage-Array-User-Guide.pdf?language=en_US)

EMC XtremIO configuration checklist:

		1. create username/password
		2. configure network for one XMS controller
		3. configure network for all iSCSI ports

EMC VNX plugin installation
---------------------------

To install EMC XtremIO plugin, follow these steps:

1. Download the plugin from
    [Fuel Plugins Catalog](https://software.mirantis.com/fuel-plugins)

2. Copy the plugin on already installed Fuel Master node; ssh can be used for
    that. If you do not have the Fuel Master node yet, see
    [Quick Start Guide](https://software.mirantis.com/quick-start/):

        # scp emc_xtremio-3.0-3.0.0-0.noarch.rpm root@<Fuel_master_ip>:/tmp

3. Log into the Fuel Master node. Install the plugin:

        # cd /tmp
        # fuel plugins --install emc_xtremio-2.0-2.0.0-0.noarch.rpm

4. Check if the plugin was installed successfully:

        # fuel plugins
        id | name        | version | package_version
        ---|-------------|---------|----------------
        1  | emc_xtremio | 3.0.0   | 3.0.0

EMC VNX plugin configuration
----------------------------

1. Create an environment with the default backend for Cinder.
2. Enable the plugin on the Settings tab of the Fuel web UI and fill in form
    fields:
   * username/password - access credentials configured on EMC XtremIO XMS
   * XMS - IP addresse of one EMC XtremIO XMS Processors
   * cluster name (optional) - In case XtremIO XMS processor is managing multiple
   clusters.
3. Deploy the environment without a Cinder node. All required Cinder services
    are run on Controller nodes.
