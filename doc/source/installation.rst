==================
Installation Guide
==================

EMC XtremIO backend configuration
============================================

Before starting a deployment, you have to preconfigure EMC XtremIO array and
connect it properly to the environment. Both EMC XMS IPs and all iSCSI ports
should be available over storage interface from OpenStack nodes. To learn more
about EMC XtremIO configuration, see `The official EMC XtremIO series
documentation
<https://support.emc.com/products/31111_XtremIO/Documentation/>`_

EMC XtremIO configuration checklist:

+------------------------------------+-------------------------+
|Item to confirm                     |  Status (tick if done)  |
+====================================+=========================+
|Create username/password            |                         |
+------------------------------------+-------------------------+
|Configure network:                  |                         |
|   - for XMS host                   |                         |
|   - for all iSCSI ports            |                         |
+------------------------------------+-------------------------+


EMC XtremIO plugin installation
============================================

#. Download the plugin from the `Fuel Plugins Catalog <https://www.mirantis.com
   /products/openstack-drivers-and-plugins/fuel-plugins/>`_.

#. Copy the plugin on already installed Fuel Master node. If you do not have
   the Fuel Master node yet, see
   `Quick Start Guide <https://software.mirantis.com/quick-start/>`_::

    # scp emc_xtremio-3.0-3.0.0-1.noarch.rpm root@<the_Fuel_Master_node_IP>:/tmp

#. Log into the Fuel Master node. Install the plugin::

    # cd /tmp
    # fuel plugins --install emc_xtremio-3.0-3.0.0-1.noarch.rpm 

#. Check if the plugin was installed successfully::

    # fuel plugins
    id | name        | version | package_version
    ---|-------------|---------|----------------
    1  | emc_xtremio | 3.0.0   | 4.0.0
