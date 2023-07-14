# Matlab Accident Clustering

The **Matlab Accident Clustering** project is a software tool that utilizes statistics and machine learning algorithms from the Statistics and Machine Learning Toolbox to perform clustering analysis on accident data. Additionally, it requires the Mapping Toolbox for mapping functionalities.

## Run Instructions

To run the **Matlab Accident Clustering** project, please follow these steps:

1. Run the `downloadAccidentData` script. This script is responsible for downloading the accident data required for analysis. However, please note that the Unfall Atlas portal frequently changes its download URLs. Therefore, it is possible that the script becomes outdated. If that happens, you will need to manually update the download URL in the script to the latest one.

2. Run the `runAnalysis` script. This script performs the clustering analysis on the downloaded accident data using the available cluster algorithms from the Statistics and Machine Learning Toolbox. Make sure the required toolbox is installed and accessible.


## Troubleshooting

Please be aware of the following issues and take necessary actions while working with the **Matlab Accident Clustering** project:

- The Unfall Atlas portal frequently changes the URLs for downloading accident data. Ensure that the `downloadAccidentData` script is up to date with the latest download URL. You may need to modify the script if the URL changes.

- The Unfall Atlas portal occasionally changes the file name endings between `.txt` and `.csv`. Ensure that the script handles both file formats correctly. Modify the script accordingly if the file name endings change.

For any other issues or difficulties, please refer to the project documentation or contact the project maintainer for support.

## License

This project is licensed under the [MIT License](LICENSE). Please refer to the license file for more information.

