maven打包包含lib的jar.md
lib在项目根目录下
```
├─fastboot-demo
│  ├─lib
│  ├─src
│  └─target
│  └─pom.xml
```
project-demo
--lib
--src
springboot
```maven
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <version>2.1.1.RELEASE</version>
                <configuration>
                    <fork>true</fork> <!-- 如果没有该配置，devtools不会生效 -->
                    <!-- 打包 包含lib -->
                    <includeSystemScope>true</includeSystemScope>
                </configuration>
                <executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
```

普通maven项目
```
        <resources>
            <resource>
                <directory>src/main/resources</directory>
            </resource>
            <resource>
                <directory>lib</directory>
                <targetPath>BOOT-INF/lib/</targetPath>
                <includes>
                    <include>*.jar</include>
                </includes>
            </resource>
        </resources>
```
完整代码
```
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
                            <mainClass>org.example.Application</mainClass>
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
        <resources>
            <resource>
                <directory>src/main/resources</directory>
            </resource>
            <resource>
                <directory>lib</directory>
                <targetPath>BOOT-INF/lib/</targetPath>
                <includes>
                    <include>*.jar</include>
                </includes>
            </resource>
        </resources>
    </build>
```