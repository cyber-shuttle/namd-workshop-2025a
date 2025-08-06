# Load the HIV-1 Protease
mol new 1bve waitfor all

# Zoom by 2x
scale by 2.0

# Select protein, to be displayed
mol modselect 0 0 protein

# Represent as New Cartoon
mol modstyle 0 0 NewCartoon 0.300000 10.000000 4.100000 0

# Color by Secondary Structure
mol modcolor 0 0 Structure

# Add a new representation
mol addrep 0

# Select DMP (the ligand), to be represented
mol modselect 1 0 resname DMP

# Represent as Licorice
mol modstyle 1 0 Licorice 0.300000 12.000000 12.000000 0 0

# Color by name
mol modcolor 1 0 Name

# Render a figure "image.png"
## Enable shadowns and ambient occlusion
display shadows on
display ambientocclusion on

## Use Tachyon to render.
render TachyonInternal image.png

# Calculate RMSD over all frames and save to rmsd.csv
## Create a selection
set sel [atomselect top protein]

set ref [atomselect top protein frame 0]

set fileId [open "rmsd.csv" w]
puts $fileId "Frame,RMSD"
for {set i 0} {$i < [molinfo top get numframes]} {incr i} { 
  $sel frame $i
  puts $fileId "$i,[measure rmsd $sel $ref ]"
} 
close $fileId
