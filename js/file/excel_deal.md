<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>js如何解析Excel文件</title>
</head>
<body>
<input type="file" onchange="impexcel(this)"/>
</body>
<script src="https://cdn.bootcss.com/xlsx/0.12.6/xlsx.full.min.js"></script>
<script type="text/javascript">
    //github地址 https://github.com/SheetJS/sheetjs
	var wb;// 读取完成的数据
	// 导入
	function impexcel(obj) {
		if (!obj.files) {
			return;
		}
		var f = obj.files[0];
        //新建文件读取
		var reader = new FileReader();
		reader.onload = function(e) {
			var data = e.target.result;
			//将文件读取为二进制字符串
			wb = XLSX.read(data, { type: "binary" });
			alert(wb.SheetNames[0]);
			// wb.SheetNames[0]是获取Sheets中第一个Sheet的名字
			// wb.Sheets[Sheet名]获取第一个Sheet的数据
			JSON.stringify(XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]]));
			alert(JSON.stringify(XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]])));
		};
		reader.readAsBinaryString(f);
	}
</script>
</html>