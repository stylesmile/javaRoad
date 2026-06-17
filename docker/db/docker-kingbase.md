docker run -d \
--name jl-kingbase \
-e "DB_USER=system" \
-e "DB_PASSWORD=Juleitech12345" \
-e "DB_MODE=-oracle" \
-p 0.0.0.0:54321:54321 \
-v "/init.sql:/docker-entrypoint-initdb.d/init.sql:ro" \
-v "./userdata:/home/kingbase/userdata" \
--restart always \
"kingbase_v009r001c002b0014_single_x86:v1"

docker run -d \
--name jl-kingbase \
-e "DB_USER=system" \
-e "DB_PASSWORD=Juleitech12345" \
-e "DB_MODE=-oracle" \
-p 0.0.0.0:54321:54321 \
-v "/opt/kingbase/userdata:/home/kingbase/userdata" \
--restart always \
"kingbase_v009r001c002b0014_single_x86:v1"



docker run -d \
--name jl-kingbase \
-e "DB_USER=system" \
-e "DB_PASSWORD=Juleitech12345" \
-e "DB_MODE=-pg" \
-p 0.0.0.0:54321:54321 \
-v "/opt/kingbase/init.sql:/docker-entrypoint-initdb.d/init.sql:ro" \
-v "/opt/kingbase/mydata:/home/kingbase/mydata" \
-v "/opt/kingbase/userdata:/home/kingbase/userdata" \
--restart always \
"kingbase_v009r001c002b0014_single_x86:v1"


ksql -h 127.0.0.1 -p 54321 -U system -d jlplatform -f /docker-entrypoint-initdb.d/init.sql

ksql -h 127.0.0.1 -U coder -W 123456 -d db2 -f /opt/kingbase/mydata/init.sql