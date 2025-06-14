import org.apache.tools.ant.filters.Native2AsciiFilter

plugins {
    java
}

repositories {
    mavenCentral()
}


group = "stars"
version = "1"
description = "lab-2"


dependencies {
    implementation("org.eclipse.persistence:org.eclipse.persistence.jpa:${properties["jpaVersion"]}")
    implementation("org.primefaces:primefaces:${properties["primefacesVersion"]}:jakarta")
    implementation("org.postgresql:postgresql:${properties["postgresqlVersion"]}")
    implementation("jakarta.servlet:jakarta.servlet-api:${properties["servletVersion"]}")
    implementation("jakarta.platform:jakarta.jakartaee-api:${properties["jakartaeeVersion"]}")
    testImplementation("org.junit.jupiter:junit-jupiter-api:${properties["junitVersion"]}")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:${properties["junitVersion"]}")
}

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(properties["javaVersion"].toString())
    }
}

tasks.register<Copy>("native2ascii") {
    val native2ascii = Native2AsciiFilter()
    from("src/main/resources") {
        include("**/*.properties")
    }

    filter { line -> native2ascii.filter(line) }

    into("ascii_resources")
    
    doFirst {
        project.mkdir(project.file("ascii_resources"))
    }
}