Vivado 2020.2 required.

## Building 
Open Vivado and run ```source ./base.tcl```
It will create a directory with a new project in Vivado/myproj
After the project is made make sure to add the constraints file located in Vivado/constraints/base.xdc

## Creating IPs
Using vitis, create a new project in Vivado/ip_repo


## Saving work for version control
In Vivado, file->Export->Export Block Diagram
This will create a .tcl file, name it base and overwrite the file located at Vivado/
Open the file in a text editor and add the following at line 49
```
set_property  ip_repo_paths  ip_repo [current_project]
update_ip_catalog
```
This tells future rebuilds where the IPs are located.
