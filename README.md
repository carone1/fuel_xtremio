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

+----------------------------------+---------------------+
| **Requirement**                  | **Version/Comment** |
+==================================+=====================+
| Mirantis OpenStack compatibility | 26.08.2016          | 
+----------------------------------+---------------------+


Limitations
-----------

Since only one storage network is available in Fuel 6.x on OpenStack nodes,
multipath will bind all storage paths from EMC on one network interface.
In case this NIC fails, the communication with storage is lost.

Installation Guide
==================

`Installation Guide <doc/source/installation.rst>`_

Configuration Guide
===================

`Configuration Guide <doc/source/configuration.rst>`_

Troubleshooting Guide
=====================

`Troubleshooting Guide <doc/source/troubleshooting.rst>`_

Tesplan
=======

`Testplan <doc/source/test-plan.rst>`_

Testplan Report
===============

`Testplan Report <doc/source/test-plan-report.rst>`_

