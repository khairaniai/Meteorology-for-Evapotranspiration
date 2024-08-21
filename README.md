<h1>Meteorology Data to Estimated Evapotranspiration</h1>
<p align="right">
Supervised by: <br/>
<p align="right">
Prof. Dr. Yonny Koesmaryono
<br/>
<p align="right">
Dr. Muh. Taufik
<br/>

<h2>Description</h2>
Reference evapotranspiration (ETo) reflects the presence of energy to evaporate water when there is sufficient water supply. The effects of ENSO in terms of uncertainties in extreme rainfall and increasing air temperature can influence vegetation dynamics and evapotranspiration processes. The approach to evapotranspiration values using the Penman-Monteith method can estimate evapotranspiration values that are close to actual values because this method is less sensitive to changes in temperature than other methods, so it focuses on thermodynamic processes (net radiation) and aerodynamics, which are the primary parameters for changes in evapotranspiration values.
<br />

<h2>Languages and Utilities Used</h2>

- <b>RStudio</b> 
- <b>Excel</b>

<h2>Environments Used </h2>

- <b>Windows 10</b>

<h2>Data</h2>
- The data used in this study includes daily meteorological data (Rainfall mm; Max temperature °C; Min temperature °C; Average temperature °C; Average humidity %; Sunshine duration hr; Average wind speed m/s). The data  was downloaded via access from ogimet or can be obtained through this link (https://www.ogimet.com).

<h2>Program walk-through:</h2>
  
<h3>Downloading Daily Climate Data (1991-2022)</h3>
<p align="left">
First, all the data should be downloaded. For this project, I used daily data from 1991-2022 for all parameters (I downloaded it separately in 5 years period because my internet connection was poor). You need to know the WMO ID for the station from which you want to download the data.
<br/>

<p align="center">
<img src="https://drive.google.com/uc?id=16j7K_831ViJev12Gp2GCFthMjOhuwqSY"/>
<br />

<p align="left">
Since encountering a significant amount of missing data, I employed a common technique for data imputation in meteorology. This method involves filling in the missing values by averaging the data points that precede and follow the gaps. This approach helps in maintaining the continuity and integrity of the dataset.
<br/>

<p align="center">
<img src="https://drive.google.com/uc?id=1B5bJ4V2cSZARzospjQ4swAb2TOHqXVeI"/>
<br />
  
<p align="left">
After all the data is complete, calculate the estimated evapotranspiration using the Penman-Monteith method, as described by the equation. I utilized Excel for this calculation; you can input your data into the provided Excel file to perform the estimation.
<br/>

<p align="center">
  <img src="https://drive.google.com/uc?id=1mQ8msTM9dnnnrXa19RHogeVhqRz4-Qd3" width="40%" />
  <img src="https://drive.google.com/uc?id=1h5LczKL6MdX2dyOA7oma8ZAjg6g1W853" width="40%" />
</p>
<p align="center">
  <img src="https://drive.google.com/uc?id=13-kBUlwFxirujDc5YHYpWbMGS-cvzga4" width="40%" />
</p>

