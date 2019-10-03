# JASMIN workshop notes

* Jasmin has 4 main types of storage:
  * POSIX (disk) (PFS, SOF and SSD - each type good for different types of files)
  * Near-Line tape (CEDA archive and Elastic tape for GWS)
  * Object store (similar to AWS)
  * Block Storage (for virtual machines)

* Only the 100GB SSD user quota is backed up, the rest is not!

* /gws/nopw means **non-parallel write**

* Large volume short time storage exists in the xfc (transfer cache) at `/work/xfc/vol[1-3]/user_cache/<username>`

* `/tmp` is different depending on where it is. See the diagram in the presentation notes for details

* You should test on the sci nodes, then submit full jobs to the LOTUS nodes from the sci nodes.

The presentation notes has more details

## Data transfer

* For large data transfers, scp is not the best. Looking at the [data transfer overview](https://help.jasmin.ac.uk/article/219-data-transfer-overview) gives details of options like rsync and gridFTP.

* xfer2 is for use within europe, xfer3 is best for larger distances.

* Globus is the best option for bulk data transfer. It is a wrapper built upon GridFTP. There is more information in the ex02 document section on alternative approaches. You need a globusID to use this service through the web app.

* OpenDAP can be used for extracting data from NetCDF. Look into setting up a local OpenDAP server for DimCOOL?

* Parallel writing can often not be done directly to group workspaces. This can be instead done by writing to `/work/scratch` and then copying over.
