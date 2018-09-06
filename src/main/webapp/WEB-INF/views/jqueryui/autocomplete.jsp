<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-themes-1.12.1/themes/redmond/jquery-ui.css" />">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.12.1/jquery-ui.js" />"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#tags').autocomplete({
		source : "../autocomplete_action/",
		minLength : 2,
		select : function(event, ui){
			alert(ui.item.value + '가 리턴됨');
		}
	});
});

</script>
</head>
<body>
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags">
</div>
 
</body>
</html>