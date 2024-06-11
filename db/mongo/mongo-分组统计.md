##根据markerId 分组统计，统计每个用户有多少条数据
db.getCollection('col_Vietnamese_20210425_1').aggregate(
    [{ "$group" : { 
        "_id" : "$recorderId",
        "value" : { "$sum" : 1 }
        }
     }]
   )
db.getCollection('col_tyw4_0710').aggregate(
    [{ "$group" : {
        "_id" : "$markerId",
        "value" : { "$sum" : 1 }
        }
     }]
   )

##据markerId 分组统计，统计并累加计算
db.col_tyw_0711_3.aggregate(
 [
  {$match:{labelStatus:1}},
  {$group:{_id:"$markerId",total:{$sum:"$order"}}}
 ]
 )
 
##据markerId 分组统计，统计并计算条数
db.col_tyw_0711_3.aggregate(
 [
  {$match:{labelStatus:1}},
  {$group:{_id:"$markerId",total:{$sum:1}}}
 ]
 )


db.getCollection('company_profile').aggregate(
    [{ "$group" : { 
        "_id" : "$city", 
        "value" : { "$sum" : 1 }
        }
     },

    { "$project" : { 
        "_id" : 0, 
        "name" : "$_id", 
        "value" : "$value" 
        }
    }]
   )
   
   
db.col_tyw_0711_3.aggregate(
[
 {$group:{_id:{markerId:"$markerId",labelStatus:"$labelStatus"},total:{$sum:1}},},
 {$project:{_id:1,total:1,labelStatus:1}}
]
)
    
