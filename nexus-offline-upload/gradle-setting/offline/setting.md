## gradle-wrapper.properties
After downloading the distributionUrl file, upload it to the internal server(Apache or Nginx) and change the url

```
example => distributionUrl=http\://<nexus domain>/distributions/gradle.zip
```

## init.gradle
```
allprojects {
    repositories {
        maven {
            credentials {
                username "<username>"
                password "<password>"
            }
            url "http://<nexus domain>/repository/<repository host group>"
        }
    }
}
```

## build.gradle
```
repositories {
    maven {
        credentials {
            username "<username>"
            password "<password>"
        }
        url "http://<nexus domain>/repository/<repository host group>"
    }
}
```

## settings.gradle
```
pluginManagement {
    repositories {
        maven {
            credentials {
                username "<username>"
                password "<password>"
            }
            url "http://<nexus domain>/repository/<repository host group>"
        }
    }
}
```