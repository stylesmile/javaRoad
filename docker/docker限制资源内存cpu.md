docker如何限制已经在运行的容器cpu和内存

docker container update  gitlabseafilegit_gitlab_1_66166xxx  --cpus="2" --memory="8g"  --memory-swap="-1"
docker container update  mongo --cpus="2" --memory="4g"  --memory-swap="10g"
docker container update  mongo --cpus="2" --memory="4g"

docker container update  rocketmq-console-ng  --cpus="1" --memory="1g"  --memory-swap="-1"


-m,--memory	内存限制，格式是数字加单位，单位可以为 b,k,m,g。最小为 4M
--memory-swap	内存+交换分区大小总限制。格式同上。必须必-m设置的大
--memory-reservation	内存的软性限制。格式同上
--oom-kill-disable	是否阻止 OOM killer 杀死容器，默认没设置
--oom-score-adj	容器被 OOM killer 杀死的优先级，范围是[-1000, 1000]，默认为 0
--memory-swappiness	用于设置容器的虚拟内存控制行为。值为 0~100 之间的整数
--kernel-memory	核心内存限制。格式同上，最小为 4M