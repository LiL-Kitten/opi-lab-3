import org.apache.tools.ant.filters.Native2AsciiFilter

plugins {
    java
    war
}

repositories {
    mavenCentral()
}

group = "stars"
version = "1"
description = "lab-2"

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(properties["javaVersion"].toString())
    }
}

dependencies {
    implementation("javax.servlet:jstl:1.2")
    implementation("org.eclipse.persistence:org.eclipse.persistence.jpa:${properties["jpaVersion"]}")
    implementation("org.primefaces:primefaces:${properties["primefacesVersion"]}:jakarta")
    implementation("org.postgresql:postgresql:${properties["postgresqlVersion"]}")
    implementation("jakarta.servlet:jakarta.servlet-api:${properties["servletVersion"]}")
    implementation("jakarta.platform:jakarta.jakartaee-api:${properties["jakartaeeVersion"]}")
    testImplementation("org.junit.jupiter:junit-jupiter-api:${properties["junitVersion"]}")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:${properties["junitVersion"]}")
}

tasks.test {
    useJUnitPlatform()
    reports {
        junitXml.required.set(true)
        html.required.set(true)
    }
}

////native2ascii: конвертация ресурсов .properties в ASCII-формат
//tasks.register<Copy>("native2ascii") {
//    val native2ascii = Native2AsciiFilter()
//    from("src/main/resources") {
//        include("**/*.properties")
//    }
//    filter { line -> native2ascii.filter(line) }
//    into("ascii_resources")
//    doFirst { project.mkdir(project.file("ascii_resources")) }
//}
// native2ascii: конвертация ресурсов .properties в ASCII-формат
tasks.register<Copy>("native2ascii") {
    from("src/main/resources") {
        include("**/*.properties")
        filter(mapOf("encoding" to "UTF-8"), Native2AsciiFilter::class.java)
    }
    into("$buildDir/ascii_resources")
    doFirst {
        println("Converting properties files with native2ascii...")
        mkdir("$buildDir/ascii_resources")
    }
}



// Процесс обработки(сначала native2ascii, затем копирование как ASCII-ресурсов)
//tasks.named<ProcessResources>("processResources") {
//    dependsOn("native2ascii")
//    from("ascii_resources") {
//        include("**/*.properties")
//    }
//}
tasks.named<ProcessResources>("processResources") {
    dependsOn("native2ascii")
    from("$buildDir/ascii_resources") {
        include("**/*.properties")
    }
}


// build (включает compileJava и processResources, упаковывает в jar и затем report)
tasks.register<Jar>("buildJar") {
    dependsOn(tasks.compileJava, tasks.processResources)
    from(sourceSets.main.get().output)
    manifest {
        attributes(
            "Implementation-Title" to project.name,
            "Implementation-Version" to project.version,
            "Main-Class" to "your.main.ClassName" // Замените на ваш класс запуска
        )
    }
    archiveBaseName.set(project.name)
    archiveVersion.set(project.version.toString())
}

tasks.register("my_build") {
    dependsOn("buildJar")
    finalizedBy("report")
}

//report (после успешного тестирования сохраняет отчеты и коммитит в SVN)
tasks.register("report") {
    dependsOn(tasks.test)
    doLast {
        val reportDir = file("${project.buildDir}/test-results/test")
        if (reportDir.exists()) {
            exec { commandLine("svn", "add", "--force", reportDir.absolutePath) }
            exec { commandLine("svn", "commit", "-m", "Add JUnit test reports: version ${project.version}") }
        } else {
            logger.lifecycle("No test report directory found at: $reportDir")
        }
    }
}