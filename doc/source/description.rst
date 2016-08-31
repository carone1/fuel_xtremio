===================================================
Guide to the EMC XtremIO Plugin for Fuel
===================================================

EMC XtremIO plugin for Fuel extends Mirantis OpenStack functionality by adding
support for EMC XtremIO arrays in Cinder using iSCSI protocol. It replaces
Cinder LVM driver which is the default volume backend that uses local volumes
managed by LVM. Enabling EMC XtremIO plugin in Mirantis OpenStack means that all
Cinder services are run on Controller nodes.

Requirements
============

+-----------------+-----------------------------------------------------------+
|Requirement      | Version/Comment                                           |
+=================+===========================================================+
|Fuel             | 8.0                                                       |
+-----------------+-----------------------------------------------------------+
|EMC XtremIO array| #. XtremIO Operational Environment running S/W version 4.0|
|                 |    or higher.                                             |
|                 | #. Array should be configured and deployed.               |
|                 | #. Array should be reachable via one of the Mirantis      |
|                 |    OpenStack networks.                                    |
+-----------------+-----------------------------------------------------------+

Limitations
============

#. Since only one storage network is available in Fuel 6.x on OpenStack nodes,
   multipath will bind all storage paths from EMC on one network interface.
   In case this NIC fails, the communication with storage is lost.

#. Fibre Channel driver is not supported.

#. EMC XtremIO plugin cannot be used together with cinder role and/or options
   'Ceph RBD for volumes (Cinder)'.
