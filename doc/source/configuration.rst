================================
EMC XtremIO plugin configuration
================================

1. Create an environment with the default backend for Cinder. Do not add Cinder
   role to any node, because all Cinder services will be run on Controllers.
   For more information about environment creation, see `Mirantis OpenStack
   User Guide - create a new environment <https://docs.mirantis.com/openstack/
   fuel/fuel-8.0/pdf/Fuel-8.0-UserGuide.pdf>`_.

2. Open Settings tab of the Fuel web UI and scroll the page down. Select the
   plugin checkbox and fill in form fields:

   .. image:: images/settings.png
      :width: 50%

================================== =============================================
Field                              Comment
================================== =============================================
Username/password                  Access credentials configured on EMC XtremIO.
XMS IP                             EMC XMS IP Address
Cluster Name (optional)            Cluster Name in case XMS is supporting
                                   multiple XtremIO clusters.
================================== =============================================

3. Adjust other environment settings to your requirements and deploy the
   environment.  For more information, see `Mirantis OpenStack User Guide -
   deploy changes <https://docs.mirantis.com/openstack/fuel/fuel-8.0/
   operations.html>`_.
