
#### Motorcycle Rules Violation Detection and Analysis System Using Deep Learning

**<u>Aim</u>** -> the development of an integrated system that can detect and analyse different types of motorcycle rule violations.

<u>Technologies Used</u> -> CNN, OpenCV, YOLO(v4)

<u>Violations Identified</u> -> helmet-less riding, over-speeding, triple riding etc.

<u>Procedure</u> ->
1) Collecting data from cctv cameras, sensors and other devices.
2) Preprocessing: image processing, data normalization & data cleaning.
3) Multiple models employed for violation detection:
	- Speed Detection: **DeepSORT** (Multiple Object Tracking) assists in vehicle tracking progess.
		- Distance to a chosen area of interest already known
		- Speed based on frame count while object inside area.
	- Helmet Detection: custom dataset (4000 images)
		- 3 classes - bike, helmet, noHelmet
		- check if bounding box of noHelmet is inside bbox of bike.
	- Number Plate Detection: If yes in above, send cutout image to this model.
	- Triple Riding: Use YoloV4 for further object detection that lies within detected bike class (unclear)

