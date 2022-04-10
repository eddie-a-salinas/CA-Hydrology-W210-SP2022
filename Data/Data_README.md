## About all_data.pkl

The primary data source file in this analysis, all_data.pkl, contains hydrologic measurements from the 
NASA Global Land Data Assimilation System (GLDAS) and the Gravity Recovery and Climate Experiment - Terrestrial Water Storage (GRACE-TWS)
models (both can be accessed via GESDISC: https://disc.gsfc.nasa.gov/datasets?keywords=GRACE), along with snowpack imagery from the 
Landsat-era Sierra Nevada Snow Reanalysis.  
  

**Dictionary:**
| Variable Name  |  Data Type | Dimensions  |  Definition |
|---|---|---|---|
| Year  | integer  | 1  |  Year of measurement |
| Month  | integer  | 1  |  Month of measurement |
| SCA  | integer  |  1 | Star Camera Assembly (SCA) Precisely determines the two satellite's orientation by tracking them relative to the position of the stars|
|  Landsat_Image | image (PIL)   |  (480,480) | Raw satellite imagery of CA/Sierra Nevada Mountains |
| BW_SCA_Image  | image (PIL)  |  (570,660) | Black/White snowpack reanalysis image from LandSat model  |
|  Color_SCA_Image |  image(PIL) | (570,660)  |  Color snowpack reanalysis image from LandSat model |
|  catdef | ndarray  | (33,37)  | Catchment deficit: the average depth of water that would need to be added in order to bring the catchment to saturation, related to groundwater table depth  |
|  rzexc | ndarray  |  (33,37) |  Root-zone excess: the amount of water in the root-zone layer (0-100 cm) in excess of the water that would be present if the entire soil moisture profile were in equilibrium |
|  evap | ndarray | (33,37)| Evapotranspiration |
|  srfexc | ndarray | (33,37)| Surface excess: excess of water in the surface layer (0-5 cm) |
|  sfmc | ndarray | (33,37)| Surface soil moisture content |
| capac | ndarray | (33,37) | Likely a measure of "Variable Infiltration Capacity" |
| SnowF | ndarray | (33,37) | Snow precipitation rate |
| RainF | ndarray | (33, 37) | Rain precipitation rate |
| prmc | ndarray | (33, 37) | Profile soil moisture content |
| sumwesn| ndarray | (33, 37) | Definition unclear |
| runoff | ndarray | (33, 37) | Storm surface runoff |
| Tair | ndarray | (33, 37) | Air Temperature (avg.) |
| RainfC | ndarray | (33, 37) | Rain from convection |
| rzmc | ndarray | (33, 37) | Root-zone (0-100cm) moisture content |

Most information for measurements can be found in the _README Document for NASA GLDAS Version 2 Data Products_ in this repository (also available at 
https://hydro1.gesdisc.eosdis.nasa.gov/data/GLDAS/GLDAS_NOAH025_M.2.1/doc/README_GLDAS2.pdf)  


For additional information on measurements and satellite imagery:  
_SCA information:_ https://earth.esa.int/eogateway/missions/grace  
_catdef information:_ Ducharne et al., 2000 https://agupubs.onlinelibrary.wiley.com/doi/full/10.1002/2015WR018417  
_rzexc information:_ Girotto et al., 2016 https://agupubs.onlinelibrary.wiley.com/doi/full/10.1002/2015WR018417  
_prmc information:_ Felsberg et al., 2021 https://journals.ametsoc.org/view/journals/hydr/22/5/JHM-D-20-0228.1.xml	

## Additional Data Sources:
Research was also done comparing the GLDAS model data with well measurements from the California Natural Resources Agency, available at https://data.cnra.ca.gov/dataset/periodic-groundwater-level-measurements. The main focus in this data was the **GSE_GWE** measurement, defined as the "depth to groundwater elevation in feet below ground surface."  
  



