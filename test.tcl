mol new structure.psf
mol addfile 1_system.1.4r.coor
set sel [ atomselect top protein ]
$sel num
quit