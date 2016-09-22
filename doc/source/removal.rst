==================
Removal Guide
==================


EMC XtremIO plugin removal
============================================

#. Delete or reset all Environments in which EMC XtremIO plugin has been enabled

#. Uninstall the plugin:

    # fuel plugins --remove emc_xtremio==3.0.2

#. Check if the plugin was uninstalled successfully::

    # fuel plugins
    id | name                      | version  | package_version
    ---|---------------------------|----------|------
