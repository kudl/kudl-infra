## build.gradle 
Add task to download jar and pom files and execute task

1. downloadToProjectMavenRepo
2. makeOfflineZip

Check the build / distributions / offline.zip folder

```
task downloadToProjectMavenRepo(type: Copy) {
    configurations.compile.files 
    configurations.runtime.files 

    from new File(gradle.gradleUserHomeDir, 'caches/modules-2/files-2.1') 
    into new File(rootDir, projectMavenRepo)
    eachFile {
        List<String> parts = it.path.split('/')
        it.path = (parts[0].replace('.', '/') + '/' + parts[1]) + '/' + parts[2] + '/' + parts[4]
    }
    includeEmptyDirs false
}

task makeOfflineZip(type: Zip, dependsOn: downloadToProjectMavenRepo) {
    from rootDir
    excludes = ['.tmp', '.gradle', 'build/gradle-home', 'build/distributions', 'build/offline/gradle/wrapper/dists']
    destinationDir(file('build/distributions'))
    archiveName = 'offline.zip'
    doLast {
        println "Created offline project zip at build/distributions/offline.zip"
    }
}
```