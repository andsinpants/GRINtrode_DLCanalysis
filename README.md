# GRINtrode_DLCanalysis
<div class="row">
  <div class="column">
   <img src="https://github.com/andsinpants/andsinpants.github.io/blob/main/static/images/papers/McCullough2022.PNG" alt="Moran2021a" style="width:30%">
  </div>
</div>

<h2>Code and data from GRINtrode Paper, see McCullough et al., 2022</h2> 
<ul><li><a href="https://www.biorxiv.org/content/10.1101/2022.06.17.496591v1" target="_blank">McCullough et al., 2022</a></li></ul>


<b>Dependent Function</b>:
DJCS_padCells.m

<b>Main Script</b>:
AKM_getfreemousemove.m

<b>DLC_output</b>:
.h5 (tracking) and .csv (pose_estimation coordinates, likelihood scores) files from each of the GRINtrode videos outputed by DLC

<b>MAT_files</b>:
.mat outputs from AKM_getfreemousemove.m MATLAB script

Script outputs the x and y position, velocity, and acceleration of 5 effectors from DLC outputs on a resnet_50 network trained on 5 videos.

Contact me @ <a href="andrew.moran@cuanschutz.edu" target="_blank">andrew.moran@cuanschutz.edu</a> for additional materials.
