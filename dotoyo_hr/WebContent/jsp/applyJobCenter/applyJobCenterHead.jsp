<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String path=request.getContextPath(); %>
<ul>
    <li><a href="<%=path%>/applyJobCenter/applyJobCenter!toApplyRecommendation.action" target="_blank"><img src="<%=path%>/images/people-botton2.png" width="143" height="28" alt="成为线下推荐对象"/></a></li>
    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在这里&nbsp;&nbsp;你还有机会</li>
    <li><a href="<%=path%>/applyJobCenter/applyJobCenter!toApplyJob.action" target="_blank"><img src="<%=path%>/images/people-botton1.png" width="81" height="28" alt="寻找工作"/></a></li>
    <li>在这里<strong><s:text name="countOFEnterprise"/></strong>个企业正在寻找人才</li>
</ul>
