<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#certType").change(function(){
			var certTypeCode = $("#certType option:selected").val();
			var url = "<%=request.getContextPath()%>/certificateCenter/certificateAction!searchCert.action?certTypeCode="+certTypeCode;
			$.getJSON(url,loadCert);
		});
	});
	loadCert=function(data){
		var options = "";
		var defaultOption = "<option value=\"\">请选择证书</option>";
		var value = "";
		var text = "";
		for(i=0;i<data.length;i++){
			value = data[i].code;
			text = data[i].name;
			options = options + "<option value=\""+value+"\">"+text+"</option>";
		}
		$("#cert").html(options);
		var defaultName = $("#certType").val();
		if(defaultName == ""){
			$("#cert").html(defaultOption);
		}
		var cityCode = $("#cert option:selected").val();
	};
</script>