### Study Design

The data come from the Human Activity Recognition Using Smartphones Dataset (Version 1.0), created from a study by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto at Smartlab - Non Linear Complex Systems Laboratory. The data collection and processing  procedure is described on their website (http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions/) as follows:

> “The experiments were carried out with a group of 30 volunteers within 
an age bracket of 19-48 years. They performed a protocol of activities 
composed of six basic activities: three static postures (standing, sitting, lying) 
and three dynamic activities (walking, walking downstairs and walking upstairs). 
All the participants were wearing a smartphone (Samsung Galaxy S II) on the waist during the experiment execution. We captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the embedded accelerometer and gyroscope of the device. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 561 features was obtained by calculating variables from the time and frequency domain.” 

The training and test data were combined into a single dataset, and of the 561 features, only the measurements on the mean and standard deviation were extracted. From this, a new data set with only the average of each variable for each activity and each subject was created. 

### Code Book

Variables describe acceleration of the body (with or without jerking), gyration of the body (with or without jerking), and the acceleration due to gravity. Measurements on the body are performed in both the time and frequency (freq) domains. They are captured with four further features: one for each axis of the phone (X, Y, and Z) and one which indicates the magnitude of the movement. The variables include the mean and standard deviation (std) of these features over the times they were measured. 

The tidy dataset calculates the mean of each variable for each subject and each activity.

Units: 
<br>Variables have been normalized and bounded within [-1,1].
<br>Units for acceleration are g’s (gravity of the earth = 9.80665 m/sec2).
<br>Units for gyroscope (gyration) are rad/sec.


 |	Variable Name |Notes
---|-------------------|------
1 | subject | subjects are numbered 1-30 
2 | activity |standing, sitting, lying, walking, walking upstairs, and walking downstairs 
3 | acceleration_time_Xaxis_mean         |
4 | acceleration_time_Yaxis_mean        |
5 | acceleration_time_Zaxis_mean         |
6 | acceleration_time_Xaxis_std         |
7 | acceleration_time_Yaxis_std         |
8 | acceleration_time_Zaxis_std         |
9 | gravity_time_Xaxis_mean              |
10 | gravity_time_Yaxis_mean             |
11 | gravity_time_Zaxis_mean             | 
12|gravity_time_Xaxis_std              
13 |gravity_time_Yaxis_std               
14|gravity_time_Zaxis_std              
15 |accelerationjerk_time_Xaxis_mean     	
16|accelerationjerk_time_Yaxis_mean    
17 |accelerationjerk_time_Zaxis_mean     
18|accelerationjerk_time_Xaxis_std     
19 |accelerationjerk_time_Yaxis_std      
20|accelerationjerk_time_Zaxis_std     
21 |gyration_time_Xaxis_mean             
22|gyration_time_Yaxis_mean            
23 |gyration_time_Zaxis_mean             
24|gyration_time_Xaxis_std             
25 |gyration_time_Yaxis_std              
26|gyration_time_Zaxis_std             
27 |gyrationjerk_time_Xaxis_mean         
28|gyrationjerk_time_Yaxis_mean        
29 |gyrationjerk_time_Zaxis_mean         
30|gyrationjerk_time_Xaxis_std         
31 |gyrationjerk_time_Yaxis_std          
32|gyrationjerk_time_Zaxis_std         
33 |acceleration_time_magnitude_mean     
34|acceleration_time_magnitude_std     
35 |gravity_time_magnitude_mean          
36|gravity_time_magnitude_std          
37 |accelerationjerk_time_magnitude_mean 
38|accelerationjerk_time_magnitude_std 
39 |gyration_time_magnitude_mean         
40|gyration_time_magnitude_std         
41 |gyrationjerk_time_magnitude_mean     
42|gyrationjerk_time_magnitude_std     
43 |acceleration_freq_Xaxis_mean         
44|acceleration_freq_Yaxis_mean        
45 |acceleration_freq_Zaxis_mean         
46|acceleration_freq_Xaxis_std         
47 |acceleration_freq_Yaxis_std          
48|acceleration_freq_Zaxis_std         
49 |accelerationjerk_freq_Xaxis_mean     
50|accelerationjerk_freq_Yaxis_mean    
51 |accelerationjerk_freq_Zaxis_mean     
52|accelerationjerk_freq_Xaxis_std     
53 |accelerationjerk_freq_Yaxis_std      
54|accelerationjerk_freq_Zaxis_std     
55 |gyration_freq_Xaxis_mean             
56|gyration_freq_Yaxis_mean            
57 |gyration_freq_Zaxis_mean             
58|gyration_freq_Xaxis_std             
59 |gyration_freq_Yaxis_std              
60|gyration_freq_Zaxis_std             
61 |acceleration_freq_magnitude_mean     
62|acceleration_freq_magnitude_std     
63 |accelerationjerk_freq_magnitude_mean 
64|accelerationjerk_freq_magnitude_std 
65 |gyration_freq_magnitude_mean         
66|gyration_freq_magnitude_std         
67 |gyrationjerk_freq_magnitude_mean     
68|gyrationjerk_freq_magnitude_std   
