EMC XtremIO Plugin for Fuel
===========================

EMC XtremIO plugin
------------------

EMC XtremIO plugin for Fuel extends Mirantis OpenStack functionality by adding
support for EMC XtremIO arrays in Cinder using iSCSI protocol. It replaces Cinder
LVM driver which is the default volume backend that uses local volumes
managed by LVM.

Requirements
------------

| Requirements                   | Version/Comment |
| ------------------------------ |:---------------:|
| Mirantis OpenStack compability | Mirantis 9.0    |
| Fuel compability               | Fuel 9.0        |
| XtremIO software compability   | >= 4.0.0        |


Limitations
-----------

Since only one storage network is available in Fuel 6.x on OpenStack nodes,
multipath will bind all storage paths from EMC on one network interface.
In case this NIC fails, the communication with storage is lost.


Installation Guide
==================

[Installation Guide] (doc/source/installation.rst)


Configuration Guide
===================

[Configuration Guide] (doc/source/configuration.rst)


User Guide
==========

[User Guide] (doc/source/guide.rst)


Plugin Removal
==============

[Plugin Removal] (doc/source/removal.rst)


Troubleshooting Guide
=====================

[Troubleshooting Guide] (doc/source/troubleshooting.rst)

Test Plan
=========

[Test Plan] (doc/source/test-plan.rst)

Test Plan Report
================

[Test Plan Report] (doc/source/test-plan-report.rst)

