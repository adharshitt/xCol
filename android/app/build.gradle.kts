plugins {

    id("com.android.application")

    id("kotlin-android")

    id("dev.flutter.flutter-gradle-plugin")

}

android {

    namespace = "com.yourname.xcol"

    compileSdk = 35

    ndkVersion = "27.0.12077973"

    compileOptions {

        // Core Library Desugaring is required for notifications

        isCoreLibraryDesugaringEnabled = true 

        sourceCompatibility = JavaVersion.VERSION_11

        targetCompatibility = JavaVersion.VERSION_11

    }

    kotlinOptions {

        jvmTarget = JavaVersion.VERSION_11.toString()

    }

    defaultConfig {

        applicationId = "com.yourname.xcol"

        minSdk = 24

        targetSdk = 35

        versionCode = flutter.versionCode

        versionName = flutter.versionName

        

        // Required when adding large libraries like TFLite

        multiDexEnabled = true 

    }

    androidResources {

        noCompress += "tflite"

        noCompress += "lite"

    }

    buildTypes {

        release {

            isMinifyEnabled = true

            isShrinkResources = true

            signingConfig = signingConfigs.getByName("debug")

            proguardFiles(

                getDefaultProguardFile("proguard-android-optimize.txt"),

                "proguard-rules.pro"

            )

        }

    }

}

dependencies {

    // This is the specific library that fixes the "Desugaring" error

    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")

}

flutter {

    source = "../.."

}

