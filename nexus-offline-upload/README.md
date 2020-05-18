## Getting Started
This is a shell script that uploads *jar, gem, yum* files in an offline environment.

When you see the sh file for each folder, you need to find the values ​​of *<username>, <password>, <nexus domain>, 
<repository host group>* and change them to the values ​​set in the nexus set in the offline environment.

### java
The java project online / offline settings are in the gradle-settings folder.
 
data directory: jar files

data-pom directory: pom file

For reference, nexus generates a pom file, but since it is not perfect, you need to upload the downloaded pom file 
using `publish-pom.sh`.

#### How to use
* Gradle-setting> online> setting.md Refer to gradle setting and download zip file

* Move the zip file to the offline environment.

* Move the jar file in the data directory and the pom file in the data-pom directory, 
and write in the order of `group_id artifact_id version filename` in maven-repository.txt.

* Execute publish.sh, publish-pom.sh

* Set and build offline project with reference to gradle-setting> offline> setting.md

### ruby
* gem file download

* Paste the gem file in the data directory.

* Execute publish.sh

### yum
* yum file download

* Paste the yum file in the data directory.

* Execute publish.sh

* Add repository from server in offline environment yum> See nexus.repo
