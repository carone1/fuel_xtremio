===================================================
Guide to the EMC XtremIO Plugin for Fuel
===================================================

EMC XtremIO plugin for Fuel extends Mirantis OpenStack functionality by adding
support for EMC XtremIO arrays in Cinder using iSCSI protocol. It replaces
Cinder LVM driver which is the default volume backend that uses local volumes
managed by LVM. Enabling EMC XtremIO plugin in Mirantis OpenStack means that all
Cinder services are run on Controller nodes.


Prerequisites
=============

+---------------------+-----------------------------------------------------------+
|Requirement          | Version/Comment                                           |
+=====================+===========================================================+
|Mirantis OpenStack   | 9.0                                                       |
+---------------------+-----------------------------------------------------------+
|EMC XtremIO array    | #. XtremIO Operational Environment running S/W version 4.0|
|                     |    or higher.                                             |
|                     | #. Array should be configured and deployed.               |
|                     | #. Array should be reachable via one of the Mirantis      |
|                     |    OpenStack networks.                                    |
+---------------------+-----------------------------------------------------------+

Requirements
============

+---------------------+-----------------------------------------------------------+
|Requirement          | Version/Comment                                           |
+=====================+===========================================================+
|OpenStack Deployment | In order to take advantage to the high availability (HA)  |
|                     | nature of OpenStack controllers, it is mandatory to deploy|
|                     | cinder nodes co-located with controllers when enabling    |
|                     | the EMC XtremIO plugin                                    |
+---------------------+-----------------------------------------------------------+


Limitations
===========

#. Since only one storage network is available in Fuel 9.x on OpenStack nodes,
   multipath will bind all storage paths from EMC on one network interface.
   In case this NIC fails, the communication with storage is lost. It is 
   important to have multiple cinder role nodes deployed in each environment

#. Fibre Channel driver is not supported.

#. EMC XtremIO plugin cannot be used together with cinder role and/or options
   'Ceph RBD for volumes (Cinder)'.


Release Notes
=============

+---------------------+-----------------------------------------------------------+
|Version              | Comment                                                   |
+=====================+===========================================================+
| 3.0-3.0.0-1         | Initial version                                           |
+---------------------+-----------------------------------------------------------+
| 3.0-3.0.1-1         | Fix bug where LVM service setings where overwritten by    |
|                     | EMC XtremIO plugin                                        |
+---------------------+-----------------------------------------------------------+
| 3.0-3.0.2-1         | Modified plugin to appear under Storage in Fuel UI        |
+---------------------+-----------------------------------------------------------+
