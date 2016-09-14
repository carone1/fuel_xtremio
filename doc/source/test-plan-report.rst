
================
Test Plan Report
================

**For XtremIO Plugin 1.0-1.0.1-1 & Mirantis OpenStack 7.0**


.. image:: images/emc-logo.png
.. image:: images/fuel-logo.png

Revision History
----------------

+---------------+---------------------+------------------------+---------------------+
| **Version**   | **Revision date**   | **Editor**             | **Comment**         |
+===============+=====================+========================+=====================+
| 1.0           | 09.07.2016          | Eric Caron             | Initial version     |
|               |                     |                        |                     |
|               |                     | (eric.caron@emc.com)   |                     |
+---------------+---------------------+------------------------+---------------------+
| 1.1           | 09.12.2016          | Eric Caron             | Integrated feedback |
|               |                     |                        | provided by         |
|               |                     | (eric.caron@dell.com)  | Mirantis            |
+---------------+---------------------+------------------------+---------------------+

Document Purpose
----------------

This document provides test run results for *System testing* of
*XtremIO* Fuel Plugin *1.0-1.0.1-1* on Mirantis OpenStack *7.0*.

Test environment
----------------

The test lab should include 5 nodes. The following designations for the
nodes:

    1) Fuel master node (w/ 50GB Disk, 2 Network interfaces [Mgmt, PXE])
    2) OpenStack Controller #1 node
    3) OpenStack Controller #2 node
    4) OpenStack Controller #3 node
    5) OpenStack Compute node

Each node shall have at least 2 CPUs, 4GB RAM, 80GB disks, 3 Network
interfaces. The 3 interfaces will be used for the following purposes:

-  **Admin (PXE) network**: Mirantis OpenStack uses PXE booting to
   install the operating system, and then loads the OpenStack packages
   for you.

-  **Private, Management and Storage networks**: All of the OpenStack
   management traffic will flow over this network (“Management” and
   “Storage” will be separated by VLANs). To re-use the network it will
   also host the private network. It will be added into each Virtual
   Machine when they boot. It will therefore be the route where traffic
   flows in and out of the VM.

-  **Private network**: OpenStack service nodes and the floating IP
   address range use this network. Public network must have access to
   the Internet.

In order to perform management operations with XtremIO cluster there is
an XtremIO Storage Management application. It is a management tool that
is available on all XMS nodes after deployment. Point your browser to
https://<xtremio\_ip>/xtremapp/index.html and download the XtremIO
Storage Management application.

Plugin's RPM
------------

+------------------------------------+----------------------------------+
| **Name**                           |  MD5 Checksum                    |
+====================================+==================================+
| emc_xtremio-1.0-1.0.1-1.noarch.rpm | 28a3fafcf35f7e3b9bf2ef6afdb90471 |
+------------------------------------+----------------------------------+

Test Coverage and Metrics
-------------------------

XtremIO Fuel Plugin System testing process had a test coverage of 100%.

Test Results Summary
--------------------

The XtremIO plugin has the following system tests.

Coverage of features
~~~~~~~~~~~~~~~~~~~~

+---------------------------------------------+-------------+
| **Parameter**                               | **Value**   |
+=============================================+=============+
| Total quantity of executed test cases       | 7           |
+---------------------------------------------+-------------+
| Total quantity of not executed test cases   | 0           |
+---------------------------------------------+-------------+
| Quantity of automated test cases            | 0           |
+---------------------------------------------+-------------+
| Quantity of not automated test cases        | 7           |
+---------------------------------------------+-------------+

Detailed testrun results
~~~~~~~~~~~~~~~~~~~~~~~~

+------------+----------------------------+--------------+--------------+---------------+---------------+
| **#**      | **Test case ID**           | **Passed**   | **Failed**   | **Skipped**   | **Comment**   |
+============+============================+==============+==============+===============+===============+
| 1          | install\_plugin            |              |              |               |               |
|            | \_deploy\_env              |      *       |              |               |               |
+------------+----------------------------+--------------+--------------+---------------+---------------+
| 2          | create\_mirror             |              |              |               |               |
|            | \_deploy\_env              |      *       |              |               |               |
+------------+----------------------------+--------------+--------------+---------------+---------------+
| 3          | modify\_env                |              |              |               |               |
|            | \_with\_plugin\_remove     |              |              |               |               |
|            | \_add\_controller          |      *       |              |               |               |
+------------+----------------------------+--------------+--------------+---------------+---------------+
| 4          | modify\_env\_with          |              |              |               |               |
|            | \_plugin\_remove           |              |              |               |               |
|            | \_add\_compute             |      *       |              |               |               |
+------------+----------------------------+--------------+--------------+---------------+---------------+
| 5          | uninstall\_plugin          |              |              |               |               |
|            | \_with\_deployed\_env      |      *       |              |               |               |
+------------+----------------------------+--------------+--------------+---------------+---------------+
| 6          | uninstall\_plugin          |      *       |              |               |               |
+------------+----------------------------+--------------+--------------+---------------+---------------+
| 7          | apply\_mu                  |              |              |       *       |               |
|            |                            |              |              |               |               |
|            |                            |              |              |               |               |
+------------+----------------------------+--------------+--------------+---------------+---------------+
| Total      | 7                          |              |              |               |               |
+------------+----------------------------+--------------+--------------+---------------+---------------+
| Total, %   | 100                        |              |              |               |               |
+------------+----------------------------+--------------+--------------+---------------+---------------+

Known issues
------------

No known issues

