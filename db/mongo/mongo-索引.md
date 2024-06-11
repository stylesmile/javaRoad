##语法中 Key 值为你要创建的索引字段，1 为指定按升序创建索引，如果你想按降序来创建索引指定为 -1 即可。

db.col.createIndex({"order":1,"markerId":1})
db.col_tyw_test_0720.createIndex({"order":1,"markerId":1})
db.col_tyw_test_0720.createIndex({"order":1,"markerId":1})
db.col_tyw_test_0720.createIndex({"order":1,"markerId":1})

db.col_tyw_test_0720.ensureIndex({order: 1, markerId: 1}, {unique: true});
db.col_tyw_test_0720.dropIndexes()

mongo 
db.col_tyw_0714.createIndex({"order": -1}, unique=true)
python
my_set.create_index([("word", DESCENDING), ("objURL", ASCENDING)], unique=True)

    
一、索引

MongoDB 提供了多样性的索引支持，索引信息被保存在system.indexes 中，且默认总是为_id创建索引，它的索引使用基本和MySQL 等关系型数据库一样。其实可以这样说说，索引是凌驾于数据存储系统之上的另一层系统，所以各种结构迥异的存储都有相同或相似的索引实现及使用接口并不足为 奇。

1.基础索引

在字段age 上创建索引，1(升序);-1(降序)：

db.users.ensureIndex({age:1})
1
_id 是创建表的时候自动创建的索引，此索引是不能够删除的。当系统已有大量数据时，创建索引就是个非常耗时的活，我们可以在后台执行，只需指定“backgroud:true”即可。

db.t3.ensureIndex({age:1} , {backgroud:true})
1
2.文档索引

索引可以任何类型的字段，甚至文档:

db.factories.insert( { name: "wwl", addr: { city: "Beijing", state: "BJ" } } );
1
//在addr 列上创建索引

db.factories.ensureIndex( { addr : 1 } );
1
//下面这个查询将会用到我们刚刚建立的索引

db.factories.find( { addr: { city: "Beijing", state: "BJ" } } );
1
//但是下面这个查询将不会用到索引，因为查询的顺序跟索引建立的顺序不一样

db.factories.find( { addr: { state: "BJ" , city: "Beijing"} } );
1
3. 组合索引

跟其它数据库产品一样，MongoDB 也是有组合索引的，下面我们将在addr.city 和addr.state上建立组合索引。当创建组合索引时，字段后面的1 表示升序，-1 表示降序，是用1 还是用-1 主要是跟排序的时候或指定范围内查询 的时候有关的。

db.factories.ensureIndex( { "addr.city" : 1, "addr.state" : 1 } );
1
// 下面的查询都用到了这个索引
db.factories.find( { "addr.city" : "Beijing", "addr.state" : "BJ" } );
db.factories.find( { "addr.city" : "Beijing" } );
db.factories.find().sort( { "addr.city" : 1, "addr.state" : 1 } );
db.factories.find().sort( { "addr.city" : 1 } );

4. 唯一索引

只需在ensureIndex 命令中指定”unique:true”即可创建唯一索引。例如，往表t4 中插入2 条记录时候报错。

db.t4.ensureIndex({firstname: 1, lastname: 1}, {unique: true});
1
5.强制使用索引

hint 命令可以强制使用某个索引。

db.t5.find({age:{$lt:30}}).hint({name:1, age:1}).explain()
1
6.删除索引
//删除t3 表中的所有索引
db.t3.dropIndexes()
1
//删除t4 表中的firstname 索引

db.t4.dropIndex({firstname: 1})