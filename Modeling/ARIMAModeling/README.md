


# ARIMA Modeling

Note that the python-based analysis can use the docker image created from [Dockerfile](Dockerfile) and the that R-based analyses should use the docker image created from [Dockerfile.RDSNB](Dockerfile.RDSNB).

### ARIMA Modeling for the GRACE Data

This is a 3-step process.  The *ARIMA_setup* notebook is used to load and stage the data.  Next ARIMA is run from the command line with an R script.  To see details on how to run it via the command line view the last few cells of the setup notebook.  Finally, to view results from the ARIMA analyses can carried out in the *ARIMA_explore_6mos_python* notebook.

**Summary Table for ARIMA Analysis of GRACE Data**

| Section      | Notebook/Note |
| ----------- | ----------- |
| ARIMA Setup      | [ARIMA_setup.ipynb](ARIMA_setup.ipynb)       |
| ARIMA Execution   | Command-line (see last few cells of the setup notebook above).  **Note** that the ARIMA models can be estimated in the R docker/container.  Also **note** that, depending on the level of parallelism, that running time can be on the order of hours or days at worst.      |
| ARIMA Review   | [ARIMA_explore_6mos_python.ipynb](ARIMA_explore_6mos_python.ipynb)        |


### ARIMA Modeling for the CNRA Data

This is a 2-step process.  The  *CNRA_ARIMA_Setup* notebooks briefly loads and reviews the CNRA data to be used for ARIMA.  It plots and isolates 4 wells to be modeled and write their data to files in a directory.  The notebooks which performs the modeling is the *CNRA_work_R* notebook which should be loaded from the R-based docker container.  

*Note* that the CNRA data files (measurments.csv and stations.csv) can be downloaded here : https://data.cnra.ca.gov/dataset/periodic-groundwater-level-measurements

**Summary Table for ARIMA Analysis of CNRA Data**

| Section      | Notebook/Note |
| ----------- | ----------- |
| CNRA_ARIMA_Setup      | [CNRA_ARIMA_Setup.ipynb](CNRA_ARIMA_Setup.ipynb) for plotting and setup      |
| CNRA_work_R | [CNRA_work_R.ipynb](CNRA_work_R.ipynb) for performing the ARIMA analysis |











