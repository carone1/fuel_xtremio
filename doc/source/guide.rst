==========
User Guide
==========

Creating Cinder volume
=========================



To verify that EMC VNX plugin is properly installed, you should create a Cinder
volume and attach it to a newly created VM using for example
`OpenStack CLI <http://docs.openstack.org/cli-reference/content/>`_ tools.

#. Install XtremIO Management Application by pointing a browser to
    https://<XtremIO-XMS-IP-Address>/xtremapp/index.html and download
    the executable.

    .. image:: images/xtremio-mgmt-appl.png

#. Connect and Authenticate XtremIO user with XMS Node

    .. image:: images/xtremio-mgmt-auth.png

#. Create a Cinder volume. In this example, a 1GB volume was created using the
   Open Stack UI

   .. image:: images/create-volume.png
      :width: 90%

#. Using the Open Stack (see the screenshot below), let’s check if the
   volume was created. The output provides information on ID, Status
   (it’s available), Size (1) and some other parameters.

   .. image:: images/volume-created.png
      :width: 90%

#. Now you can see how it looks on EMC XtremIO.

   Using XtremIO Management Application you can check if there is a volume with the same ID

   .. image:: images/xtremio-volume-created.png
      :width: 90%

   In the given example name: bd1c813c-9810-4955-bba4-503802391642

   It matches the ID shown on the OpenStack UI page. 

#. Now create a new VM.

   .. image:: images/create-instance.png
      :width: 90%


#. Show details of the new VM to check its state and to see on which node it
   has been created. We see that the VM is running on the node-3 and it is active:

   .. image:: images/instance-created.png
      :width: 90%

  .. image:: images/instance-overview.png
     :width: 90%

#. Attach the Cinder volume to the VM 
   
   .. image:: images/volume-attached.png
      :width: 90%

#. To list storage groups configured on EMC XtremIO
   
   Image to be added


#. You can also check if iSCSI sessions are active 

   Look at “Logged In” parameter of each port. In the given example, all four
   sessions are active (in the output, it looks like Logged In: YES).

#. When you log into the node-3 node, you can verify the following; if iSCSI
   sessions are active using iscsiadm -m session command, if a multipath device
   has been created by multipath daemon using multipath -ll command, if VM is
   using the multipath device using
   *lsof -n -p `pgrep -f <VM id>` | grep /dev/<DM device name>* command:

   .. image:: images/iscsiadmin.png
      :width: 90%

   In the example, there are four active sessions (the same as on the EMC) and
   the multipath device dm-2 has been created. The multipath device has four
   paths and all are running (each one per iSCSI session). In the output of the
   third command,  you can see that qemu is using */dev/dm-2* multipath device,
   so everything is fine.
