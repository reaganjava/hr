<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>top</title>
<link href="../../css/system-manage.css" rel="stylesheet" type="text/css" />
<script src="../../javascripts/common/jquery.js"></script>
<script src="../../javascripts/common/jquery-ui-1.7.2.custom.min.js"></script>
<script src="../../javascripts/common/accordion.js"></script>
<script type="text/javascript">
function changeMenu(obj)
{
	for(var i=1;i<=8;i++)
	{
		$("#menu0"+i).attr("class","nav-on");
	}
	
	$(obj).attr("class","nav-out");
}

$(function(){
            // Accordion
            $("#leftNav").accordion({
                header: "h3",
                collapsible: true,
				autoHeight: false,
                active: false,
				multipleMode: true
            });
        });
</script>
</head>

<body>
<jsp:include page="/jsp/systemManage/top.jsp"></jsp:include>
<div class="content">
<jsp:include page="/jsp/systemManage/left.jsp"></jsp:include>
<jsp:include page="/jsp/systemManage/right.jsp"></jsp:include>
</div>
</body>
</html>