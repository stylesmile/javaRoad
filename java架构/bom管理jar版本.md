一个中大型的 Java 基础框架项目往往包含许多 JAR 包，如果将这些 JAR 包单独发布给业务开发使用，这些不同版本 JAR 包间的兼容性维护将变得十分麻烦。为了解决这个问题，可以让一个特殊的模块引用这些 JAR 包，将一组 JAR 包兼容的版本号定义在这个模块中，对外发布时只发布这个特殊模块。这个特殊模块就是 BOM(Bill Of Materials)。
      著名的 Spring Boot 就使用了这种方式来管理版本号，这个模块就是 spring-boot-dependencies，用户在使用 Spring Boot Starter 相关依赖时引入特定版本的 spring-boot-dependencies，然后在引入其它依赖时只需要声明 group 和 name 即可，不需要再指定版本号了。当然，在 Gradle 中使用 Spring Boot 插件，或者在 Maven 中使用 spring-boot-starter-parent 作为父模块也能够达到类似的效果。
本文将介绍如何通过 Gradle 来制作一个 BOM 以及如何在 Gradle 中使用 BOM。作为 Maven 中的一个概念，也可以使用 Maven 也可以制作和使用 BOM，但本文不涉及。
1. BOM 介绍
BOM (Bill Of Material) 是 Maven 仓库中的一个概念，它本质也是一个可被引用的包，但不包含代码，只是声明了一系列其它包。例如：Maven 中央仓库中的 spring-boot-dependencies](https://repo1.maven.org/maven2/org/springframework/boot/spring-boot-dependencies/2.4.4/) 包。它只有一个 .pom 文件。
下面是 Maven 官网上的一个简单的 BOM 的.pom文件：
```maven
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
<modelVersion>4.0.0</modelVersion>
<groupId>com.test</groupId>
<artifactId>bom</artifactId>
<version>1.0.0</version>
<packaging>pom</packaging>
<properties>
<project1Version>1.0.0</project1Version>
<project2Version>1.0.0</project2Version>
</properties>
  <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>com.test</groupId>
        <artifactId>project1</artifactId>
        <version>${project1Version}</version>
      </dependency>
      <dependency>
        <groupId>com.test</groupId>
        <artifactId>project2</artifactId>
        <version>${project2Version}</version>
      </dependency>
    </dependencies>
  </dependencyManagement>
  <modules>
    <module>parent</module>
  </modules>
</project>
```

这个文件声明了两个包（project1 和 project2）及其版本号，和一般 .pom 文件中的声明不同的是， 节点外面还包含了一层 节点。以上就是 BOM 包中最核心的文件的基本结构了；基于 Gradle 发布 BOM 包的本质就是生成这样的一个文件。
2. 使用 Gradle 制作一个 BOM
这里我们假定要创建一个 BOM，用来统一管理三方 Java 包，其它业务模块通过引用这个 BOM 来间接引用需要使用的第三方 Java 包。工程完整代码：https://github.com/Robothy/gradle-bom-example

2.1 创建 BOM 工程
Gradle 中的 BOM 工程需要使用java-platform插件，这样的工程是一个不包含源代码，只包含包声明的特殊的组件，也被称为平台（platform）。



build.gradle 部分代码

```gradle
plugins {
    id 'java-platform'
}
dependencies {
    constraints {
        // 声明一些三方包及其版本号
        api "org.apache.kafka:kafka-clients:2.6.0"
        api "redis.clients:jedis:3.5.2"
    }
}
```
maven 代码
```aidl
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>io.github.stylesmile</groupId>
    <artifactId>fastboot-parent</artifactId>
    <version>0.1.8-m1</version>
    <name>fastboot-parent</name>
    <packaging>pom</packaging>
    <properties>
        <java.version>1.8</java.version>
        <!--        <fastboot.version>0.1.1-snapshots</fastboot.version>-->
        <fastboot.version>0.1.8-m1</fastboot.version>
    </properties>
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>io.github.stylesmile</groupId>
                <artifactId>fastboot-core</artifactId>
                <version>0.1.8-m1</version>
            </dependency>
            <dependency>
                <groupId>org.mybatis</groupId>
                <artifactId>mybatis</artifactId>
                <version>3.5.9</version>
            </dependency>
            <dependency>
                <groupId>com.google.code.gson</groupId>
                <artifactId>gson</artifactId>
                <version>2.9.0</version>
            </dependency>
            <dependency>
                <groupId>org.projectlombok</groupId>
                <artifactId>lombok</artifactId>
                <version>1.18.24</version>
            </dependency>
        </dependencies>
    </dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <scope>compile</scope>
            <optional>true</optional>
        </dependency>
    </dependencies>
    <description>java web project for Fast Boot</description>
    <modules>
        <!--        <module>fastboot-parent</module>-->
        <module>fastboot-core</module>
    </modules>
    <!--项目信息...-->
    <url>https://github.com/stylesmile/fastboot</url>

    <!--开源协议...-->
    <licenses>
        <license>
            <name>The Apache Software License, Version 2.0</name>
            <url>http://www.apache.org/licenses/LICENSE-2.0.txt</url>
        </license>
    </licenses>

    <!--开发者信息-->
    <developers>
        <developer>
            <id>stylesmile</id>
            <name>Stylesmile</name>
            <email>3239866994@qq.com</email>
            <roles>
                <role>Project Manager</role>
                <role>Architect</role>
            </roles>
            <timezone>+8</timezone>
        </developer>
    </developers>

    <!--项目在github或其它托管平台的地址-->
    <scm>
        <connection>https://github.com/stylesmile/fastboot.git</connection>
        <developerConnection>scm:git:ssh://git@github.com:stylesmile/fastboot.git</developerConnection>
        <url>https://github.com/stylesmile/fastboot</url>
    </scm>
    <profiles>
        <profile>
            <!--注意,此id必须与setting.xml中指定的一致,不要自作聪明改它名字-->
            <id>ossrh</id>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <build>
                <!--发布到中央SNAPSHOT仓库插件-->
                <plugins>

                    <!-- GPG -->
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-gpg-plugin</artifactId>
                        <version>1.5</version>
                        <executions>
                            <execution>
                                <phase>verify</phase>
                                <goals>
                                    <goal>sign</goal>
                                </goals>
                            </execution>
                        </executions>
                    </plugin>


                    <!-- Source -->
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-source-plugin</artifactId>
                        <version>3.0.1</version>
                        <configuration>
                            <attach>true</attach>
                        </configuration>
                        <executions>
                            <execution>
                                <phase>compile</phase>
                                <goals>
                                    <goal>jar</goal>
                                </goals>
                            </execution>
                        </executions>
                    </plugin>

                    <!-- Javadoc -->
                    <plugin>
                        <groupId>org.apache.maven.plugins</groupId>
                        <artifactId>maven-javadoc-plugin</artifactId>
                        <version>2.10.3</version>
                        <executions>
                            <execution>
                                <phase>package</phase>
                                <goals>
                                    <goal>jar</goal>
                                </goals>
                                <configuration>
                                    <additionalparam>-Xdoclint:none</additionalparam>
                                </configuration>
                            </execution>
                        </executions>
                    </plugin>
                    <plugin>
                        <groupId>org.sonatype.plugins</groupId>
                        <artifactId>nexus-staging-maven-plugin</artifactId>
                        <version>1.6.7</version>
                        <extensions>true</extensions>
                        <configuration>
                            <serverId>ossrh</serverId>
                            <nexusUrl>https://s01.oss.sonatype.org/</nexusUrl>
                            <autoReleaseAfterClose>true</autoReleaseAfterClose>
                        </configuration>
                    </plugin>
                </plugins>
            </build>

            <distributionManagement>
                <snapshotRepository>
                    <!--注意,此id必须与setting.xml中指定的一致-->
                    <id>ossrh</id>
                    <name>snapshots</name>
                    <url>https://s01.oss.sonatype.org/content/repositories/snapshots</url>
                    <!--                    <url>https://oss.sonatype.org/content/repositories/snapshots/</url>-->

                </snapshotRepository>
                <repository>
                    <id>ossrh</id>
                    <name>releases</name>
                    <url>https://s01.oss.sonatype.org/service/local/staging/deploy/maven2/</url>
                    <!--                    <url>https://oss.sonatype.org/service/local/staging/deploy/maven2/</url>-->
                </repository>
            </distributionManagement>
        </profile>

    </profiles>
    <repositories>
        <repository>
            <id>sonatype-snapshots</id>
            <name>snapshots</name>
            <url>https://s01.oss.sonatype.org/content/repositories/snapshots</url>
        </repository>
        <repository>
            <id>sonatype-releases</id>
            <name>snapshots</name>
            <url>https://s01.oss.sonatype.org/content/repositories/releases/</url>
        </repository>
        <repository>
            <id>central</id>
            <name>Central Repository</name>
            <url>https://repo2.maven.org/maven2/</url>
        </repository>
        <repository>
            <id>ali</id>
            <url>https://maven.aliyun.com/repository/public</url>
        </repository>
    </repositories>
    <pluginRepositories>
        <pluginRepository>
            <id>ali</id>
            <url>https://maven.aliyun.com/repository/public</url>
        </pluginRepository>
    </pluginRepositories>
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <compilerArgument>-parameters</compilerArgument>
                    <source>1.8</source>
                    <target>1.8</target>
                    <encoding>UTF-8</encoding>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
```


上面代码中，三方包的声明没有放在 dependencies中，而是放在了 constraints 里面。这表示如果使用了其中的包，优先使用 constraints 中声明的版本。

BOM 项目中声明包的方式有两种：

api 表示包在编译期可见。

runtime 表示包在运行期间可见。



2.2 BOM 的发布

BOM 的发布需要使用 maven-publish 插件，其发布配置如下：
```maven
publishing {
    publications {
        thirdPartPlatform(MavenPublication){
            from components.javaPlatform
            artifactId = "third-part-dependencies"
        }
    }
    repositories {
        mavenLocal()
    }
}
```


BOM 的命名一般以 -dependencies 结尾，这里我们取名为third-part-dependnecies。

执行./gradlew.bat publish 就可以将 BOM 发布到本地的 Maven 仓库了。发布的 artifacts 包含两个主要文件（.pom 和 .module）和若干校验文件。其中 .pom 的文件内容为 Maven 官方定义的 BOM 的标准格式，而 .module 文件内容是 Gradle 描述元数据的一种格式。



2.3 BOM 的使用
普通的 Java 应用或者 Java 库使用 BOM 的时候需要先添加 BOM 依赖，然后使用其它的库。例如：

```gradle
// 引入 BOM
implementation platform("org.example:third-part-dependencies:1.0")
// 引入包，这时不需要再指定版本号

implementation "org.apache.kafka:kafka-clients"
```

当然，BOM 工程或者说 platform 工程也可以使用 BOM。
使用的时候需要在 dependencies 下面引入 BOM，然后在 constraints 下面声明要使用的库，声明的时候无须指定版本。另外，需要在 configurations 中调用javaPlatform.allowDependencies()，否则会报错。
gradle 方式1
```aidl
plugins {
    id 'java'
//    id 'java-platform'
}

group 'org.example'
version '1.0-SNAPSHOT'

repositories {
    maven {url "https://s01.oss.sonatype.org/content/repositories/releases/"}
    maven {url "https://repo2.maven.org/maven2/"}
    mavenCentral()
}

jar {
    // 详细信息参考 https://docs.gradle.org/current/dsl/org.gradle.api.tasks.bundling.Jar.html
    archivesBaseName = 'fastboot'//基本的文件名
    archiveVersion = '0.0.3' //版本
    manifest { //配置jar文件的manifest
        attributes(
                "Manifest-Version": 1.0,
                'Main-Class': 'com.example.Application' //指定main方法所在的文件
        )
    }
    //打包依赖包
    from {
        (configurations.runtimeClasspath).collect {
            it.isDirectory() ? it : zipTree(it)
        }
    }
}
dependencies {
    // 引入 BOM
    implementation platform("io.github.stylesmile:fastboot-parent:0.1.8-m1")
    implementation 'io.github.stylesmile:fastboot-core'
    testImplementation 'org.junit.jupiter:junit-jupiter-api:5.8.1'
    testRuntimeOnly 'org.junit.jupiter:junit-jupiter-engine:5.8.1'
}
test {
    useJUnitPlatform()
}
```

gradle 方式2
```aidl
plugins {
    id 'java'
    id 'io.spring.dependency-management' version '1.0.11.RELEASE'
}

group 'org.example'
version '1.0-SNAPSHOT'
repositories {
    maven {url "https://s01.oss.sonatype.org/content/repositories/releases/"}
    maven {url "https://repo2.maven.org/maven2/"}
    mavenCentral()
}
jar {
    //详细信息参考 https://docs.gradle.org/current/dsl/org.gradle.api.tasks.bundling.Jar.html
    archivesBaseName = 'fastboot-demo'//基本的文件名
    archiveVersion = '0.0.1' //版本
    manifest { //配置jar文件的manifest
        attributes(
                "Manifest-Version": 1.0,
                'Main-Class': 'com.example.Application' //指定main方法所在的文件
        )
    }
    //打包依赖包
    from {
        (configurations.runtimeClasspath).collect {
            it.isDirectory() ? it : zipTree(it)
        }
    }
}
dependencies {
    implementation 'io.github.stylesmile:fastboot-core'
}
dependencyManagement {
    imports {
        mavenBom 'io.github.stylesmile:fastboot-parent:0.1.8-m1'
    }
}
tasks.named('test') {
    useJUnitPlatform()
}
```

maven引用bom方式
```maven
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
<modelVersion>4.0.0</modelVersion>
<groupId>org.stylesmile</groupId>
<artifactId>fastboot-example</artifactId>
<version>0.1.6</version>
<name>fastboot-example</name>
<description>Demo project for Fast Boot</description>
<properties>
<java.version>1.8</java.version>
</properties>
<!--        <parent>-->
<!--            <groupId>io.github.stylesmile</groupId>-->
<!--            <artifactId>fastboot-parent</artifactId>-->
<!--            <version>0.1.6</version>-->
<!--        </parent>-->

    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>io.github.stylesmile</groupId>
                <artifactId>fastboot-parent</artifactId>
                <version>0.1.7-M2</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>io.github.stylesmile</groupId>
            <artifactId>fastboot-core</artifactId>
        </dependency>
    </dependencies>
    <repositories>
<!--        <repository>-->
<!--            <id>ali</id>-->
<!--            <url>https://maven.aliyun.com/repository/public/</url>-->
<!--        </repository>-->
        <repository>
            <id>maven1</id>
            <url>https://s01.oss.sonatype.org/content/repositories/releases/</url>
        </repository>
        <repository>
            <id>maven2</id>
            <url>https://repo1.maven.org/maven2/</url>
        </repository>
    </repositories>

    <build>
        <finalName>${project.artifactId}</finalName>
        <plugins>
            <!-- 配置编译插件 -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <compilerArgument>-parameters</compilerArgument>
                    <source>1.8</source>
                    <target>1.8</target>
                    <encoding>UTF-8</encoding>
                </configuration>
            </plugin>

            <!-- 配置打包插件（设置主类，并打包成胖包） -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-assembly-plugin</artifactId>
                <version>3.3.0</version>
                <configuration>
                    <finalName>${project.artifactId}</finalName>
                    <appendAssemblyId>false</appendAssemblyId>
                    <descriptorRefs>
                        <descriptorRef>jar-with-dependencies</descriptorRef>
                    </descriptorRefs>
                    <archive>
                        <!-- 此处，要改成自己的程序入口（即 main 函数类） -->
                        <manifest>
                            <mainClass>com.example.Application</mainClass>
                        </manifest>
                    </archive>
                </configuration>
                <executions>
                    <execution>
                        <id>make-assembly</id>
                        <phase>package</phase>
                        <goals>
                            <goal>single</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
</project>
```

代码地址

```github
https://gitee.com/stylesmile/fastboot/tree/master/fastboot-example
```