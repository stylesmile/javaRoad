#Maven定制化打包后的包名

##默认Maven的包名为:

<build>  
    <finalName>${project.artifactId}-${project.version}</finalName>  
</build> 

##你可以定制为其它你想要的名字,如:

<build>  
    <finalName>${project.artifactId}-${project.version}-company</finalName>  
</build> 

<build>  
    <finalName>${project.artifactId}</finalName>  
</build>  

##加入时间戳:

<properties>  
  <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>  
  <maven.build.timestamp.format>yyyy-MM-dd_HH_mm</maven.build.timestamp.format>  
</properties>  

<build>  
  <finalName>${project.artifactId}-${maven.build.timestamp}</finalName>  
</build>