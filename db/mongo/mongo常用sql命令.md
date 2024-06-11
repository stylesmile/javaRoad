###mongo批量修改md
db.col_yingyu_1121.update({},{$set:{'getCount':1}},{multi:true})
### mongo批量修改
db.getCollection("user").update( { _id: { $gt:NumberInt("10014457")} }, { $set: { "chainBalance.borzoiBalance": NumberDecimal("0") } },{multi:true} )
### mongo 一个字段大于另外一个字段
db.col_yingyu_1123.find({"validTime":{"$ne":null},"$where": "this.validTime > this.totalTime"})

### 循环，批量修改 函数
db.CargoUserProfiles.find().forEach(
 function(item){
   db.CargoUserProfiles.update({"_id":item._id},{"$set":{"LastUpdate":item.CreateAt}},false,true)
 }
)

db.col_yingyu_1123.find({"labelStatus":{"$gt":1}}).forEach(
 function(item){
	 if(item.order == 2060)	{
	    db.col_yingyu_1123.update({"_id":item._id},{"$set":{"totalTime":item.validTime}},true,true)
	 }
 }
)

db.col_yingyu_1123.find({"labelStatus":{"$gt":1}}).forEach(
 function(item){
	 if(item.validTime > item.totalTime)	{
	    db.col_yingyu_1123.update({"_id":item._id},{"$set":{"totalTime":item.validTime}},true,true)
	 }
 }
)

db.col_yingyu_1123.find()
db.col_yingyu_1123.find({"validTime":{"$ne":null},"$where": "this.validTime > this.totalTime"})