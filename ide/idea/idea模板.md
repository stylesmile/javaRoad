##模板参数
```
*
 * @description //TODO $end$
 * @author chenye
 * @date $time$ $date$
 * @param $param$
 * @return $return$
 **/

```

time
```
time()
```

date
```
date()
```

param 
```$xslt
groovyScript("def result=''; def stop=false; def params=\"${_1}\".replaceAll('[\\\\[|\\\\]|\\\\s]', '').split(',').toList(); if (params.size()==1 && (params[0]==null || params[0]=='null' || params[0]=='')) { stop=true; }; if(!stop) { for(i=0; i < params.size(); i++) {result +=((i==0) ? '\\r\\n' : '') + ((i < params.size() - 1) ? ' * @param: ' + params[i] + '\\r\\n' : ' * @param: ' + params[i] + '')}; }; return result;", methodParameters())

```

##其他
修改快捷键为回车（enter）