### mongodb批量修改


```mongo
db.user_gift_income.update(
    {"dealTime" : 1722960000000}
    ,{$set:{'dealTime':1722787200000}}
    ,{multi:true}
)

```

```mongo
db.getCollection('user_gift_income').find({"dealTime" : 1722960000000}).forEach(
    function(item){                
        db.getCollection('bond_sentiment_news').update({"_id":item._id},{$set:{"dealTime":1722873600000}})
    }
)
```

