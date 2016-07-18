# final-year-project
The repository is the matlab code I wrote during my final year (2014-2015), the topic is " Magnetic Field strength of  molecular cloud by using polarisation data "

Abstract
This project  tries to determine the plane of sky component of magnetic field in molecular 
cloud by magnetic field morphology, obtained from linearly polarized sub-millimeter thermal 
emission of molecular cloud. This report will present the relevant Physics background of 
molecular cloud formation, the improvement that have been made in this semester, and 
compare with the standard result.


These script are written by Paros Kwan King Hong(paroskwan@gmail.com),
under the supervision of Prof Li Hua-Bai.

The are designed and run on Matlab(2012 alpha).

v1.1

Input Data
The input data are Polarization(Pol) Angle and column density, take DR21 as example:
dr21.txt : contains the RA pixel offset, DEC pixel offset, and Pol Angle. Please fix the format.
           The data are from paper : 350um Polarimetry From The Caltech Submillimeter Observatory
DR21.fits: Not included in the file, download directly from JCMT online data archive, which is a 
           13-CO(2-->1) scan of DR21.

The Script
fypfits  : which process the fits file, adding up useful channel being chose manually.
fyp      : the main script to draw bfield line and tan line.
fypplot  : which output the lines and column density on a graph, note that the  column density display 
           is processed to have low resolution for faster computation(need improvement).

The rest are funcition.



Naming rule : 
Variable - non-capital letter ,saparated by "_"
Variable(another way) - single Capital letter (except inbuild)
Array    - start with Capital letter except first word,saparated by "_"
Function - start with Capital letter , no saparation(except inbuild)

Runnig note :

%%%%CHANGE : variables are to be changed at each run
%%%ALT     : Alternative way to run the script (usually choose between two) 
