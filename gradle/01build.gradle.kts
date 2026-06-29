allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://repo.huaweicloud.com/repository/maven/") }
        maven { url = uri("https://mirrors.cloud.tencent.com/nexus/repository/maven-public/") }
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    afterEvaluate {
        if (this is org.gradle.api.Project && (plugins.hasPlugin("com.android.library") || plugins.hasPlugin("com.android.application"))) {
            // Configure Kotlin JVM target for all Android projects
            tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
                compilerOptions {
                    jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
                }
            }

            val androidExtension = extensions.findByType<com.android.build.gradle.BaseExtension>()
            androidExtension?.let { android ->
                // Fix for Inconsistent JVM-target compatibility
                android.compileOptions {
                    sourceCompatibility = JavaVersion.VERSION_17
                    targetCompatibility = JavaVersion.VERSION_17
                }
                
                // 统一所有 Android 子模块的 compileSdk，以避免 android:attr/lStar 等资源缺失
                try {
                    android.compileSdkVersion(36)
                    println("compileSdkVersion set to 36 for project: ${this.name}")
                } catch (e: Throwable) {
                    println("Skip setting compileSdkVersion for project: ${this.name} -> ${e.message}")
                }
                val currentNamespace = android.namespace
                println("project: ${this.name} Namespace get: $currentNamespace")


                val packageName = currentNamespace
                    ?: android.defaultConfig.applicationId
                    ?: android.sourceSets.getByName("main").manifest.srcFile.readText().let { manifestText ->
                        val regex = Regex("package=\"([^\"]*)\"")
                        regex.find(manifestText)?.groupValues?.get(1)
                    }
                    ?: group.toString()


                android.namespace = packageName
                println("Namespace set to: $packageName for project: ${this.name}")


                val manifestFile = android.sourceSets.getByName("main").manifest.srcFile
                if (manifestFile.exists()) {
                    var manifestText = manifestFile.readText()
                    if (manifestText.contains("package=")) {
                        manifestText = manifestText.replace(Regex("package=\"[^\"]*\""), "")
                        manifestFile.writeText(manifestText)
                        println("Package attribute removed in AndroidManifest.xml for project: ${this.name}")
                    } else {
                        println("No package attribute found in AndroidManifest.xml for project: ${this.name}")
                    }
                } else {
                    println("AndroidManifest.xml not found for project: ${this.name}")
                }
            }
        }
    }
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
