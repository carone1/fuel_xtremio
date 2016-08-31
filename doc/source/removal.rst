==================
Removal Guide
==================


EMC XtremIO plugin removal
============================================

#. Delete or reset all Environments in which EMC XtremIO plugin has been enabled

#. Uninstall the plugin:

    # fuel plugins --remove emc_xtremio==1.0.0

#. Check if the plugin was uninstalled successfully::

    # fuel plugins
    id | name                      | version  | package_version
    ---|---------------------------|----------|------
