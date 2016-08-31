================================
EMC XtremIO plugin configuration
================================

1. Before starting a deployment you have to preconfigure EMC XtremIO array and connect
it properly to the environment. Both EMC XMS IP and all iSCSI ports should be
available over storage interface from OpenStack nodes. To learn more about
EMC XtremIO configuration, see

`Official EMC XtremIO series documentation <https://support.emc.com/products/31111_XtremIO/Documentation>`_

	EMC XtremIO configuration checklist:

		1. create username/password
		2. configure network for one XMS controller
		3. configure network for all iSCSI ports

2. Create an environment with the default backend for Cinder. Do not add Cinder
   role to any node, because all Cinder services will be run on Controllers.
   For more information about environment creation, see `Mirantis OpenStack
   User Guide - create a new environment <https://docs.mirantis.com/openstack/
   fuel/fuel-8.0/pdf/Fuel-8.0-UserGuide.pdf>`_.


3. Open Settings tab of the Fuel web UI and scroll the page down. Select the
   plugin checkbox and fill in form fields:

   ================================== =============================================
   Field                              Comment
   ================================== =============================================
   Username/password                  Access credentials configured on EMC XtremIO.
   XMS IP                             EMC XMS IP Address
   Cluster Name (optional)            Cluster Name in case XMS is supporting
                                      multiple XtremIO clusters.
   ================================== =============================================

  

   .. image:: images/fuelXtremIOConfig.png
      :width: 90%



4. Adjust other environment settings to your requirements and deploy the
   environment.  For more information, see `Mirantis OpenStack User Guide -
   deploy changes <https://docs.mirantis.com/openstack/fuel/fuel-8.0/
   operations.html>`_.
