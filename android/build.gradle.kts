// android/build.gradle.kts

allprojects {

    repositories {

        google()

        mavenCentral()

    }

}

// Resetting to standard Flutter build location so FlutLab can find the APK

rootProject.layout.buildDirectory.set(file("${project.projectDir}/../build"))

subprojects {

    project.layout.buildDirectory.set(file("${rootProject.layout.buildDirectory.get()}/${project.name}"))

}

subprojects {

    project.evaluationDependsOn(":app")

}

tasks.register<Delete>("clean") {

    delete(rootProject.layout.buildDirectory)

}

