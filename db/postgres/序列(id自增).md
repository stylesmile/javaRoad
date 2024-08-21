### 创建序列
```pg

CREATE SEQUENCE if not exists id_seq_im_friend
INCREMENT 1
MINVALUE 1
MAXVALUE 9223372036854775807
START 10000000
CACHE 1;
alter table im_friend alter column "id" set default nextval('id_seq_im_friend');
```
```angular2html
CREATE SEQUENCE sequence_name
    [ INCREMENT BY increment ]
    [ MINVALUE minvalue | NO MINVALUE ]
    [ MAXVALUE maxvalue | NO MAXVALUE ]
    [ START WITH start ]
    [ CACHE cache ]
    [ CYCLE | NO CYCLE ]
    [ OWNED BY table_name.column_name | NONE ];
```
选项说明：
INCREMENT BY increment：定义序列每次调用时增加的值，默认为 1。
MINVALUE minvalue 和 MAXVALUE maxvalue：定义序列可以产生的最小和最大值。
START WITH start：定义序列的起始值，默认为 1 或 MINVALUE。
CACHE cache：定义预分配的序列值的数量，默认为 1。
CYCLE 或 NO CYCLE：如果选择了 CYCLE，当序列达到最大或最小值时，它将从另一端重新开始；如果没有选择，则会停止并抛出错误。
OWNED BY table_name.column_name | NONE：指定序列是否与某个表的列相关联，并在删除表时如何处理序列。
示例
假设我们要创建一个名为 my_sequence 的序列，它从 1 开始，每次递增 1，最小值为 1，最大值为 10000，并且循环。
### 默认值
```pg
nextval('id_im_user'::regclass)
```
### 用法
```use
函 数	                            返 回 类 型	     描述
currval( regclass )	                bigint	     获取指定序列最近一次使用netxval后的数值，如果没有使用nextval而直接使用currval会出错。
lastval()	                        bigint	     返回最近一次用 nextval 获取的任意序列的数值
nextval(regclass )	                bigint	     递增序列并返回新值
setval(regclass,bigint )	        bigint	     设置序列的当前数值
setval(regclass,bigint,boolean)	bigint	     设置序列的当前数值以及 is_called 标志，如果为true则立即生效，如果为false，则调用一次nextval后才会生效
```

nextval('id_im_user'::regclass)

需要什么值就去找具体的函数就行了。
### 表插入自增案例
```angular2html
create table test(
	id int primary key,
	age int
)

insert into test values(
nextval('test_id_seq') , 1
)

```
