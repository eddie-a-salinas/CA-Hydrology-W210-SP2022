# ConvLSTM Modeling

The notebook [ConvLSTM.ipynb](ConvLSTM.ipynb) will train 8 models to predict the 10 hydrologic regions (the base model is used 3 times), 
then combine those models' predictions into a single array of catdef predcition values that covers all of California for each of the months 
prescribed in the test_months array.

It requires that the all_data.pkl file is present in the Data folder (this file is required for all project notebooks). Region_mask.csv must also be present 
in the Data folder.

It saves the models into a folder called CLSTM_temp, which are then reloaded to compile predictions. This is done because running all 
8 models often exhausts all available memory, so each model is saved and then deleted from the runtime until all other models have been saved.

The models are trained using the best features for each region as determined by our testing of 44 permutations. Those notebooks are in this repo 
under CA-Hydrology-W210-SP2022/Visualizations and Analysis/ConvLSTM_scratch_notebooks,
but likely require considerable reconfiguration to run.

The final output predictions are saved in
CA-Hydrology-W210-SP2022/Modeling/Ensemble Modeling/convlstm_predictions.pkl,
and should be ready for use by the ensembling notebooks.
