#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
<!DOCTYPE html>

<%@ attribute name="pageTitle" type="java.lang.String"%>
<%@ attribute name="active" required="false" type="java.lang.String"%>
<%@ attribute name="pageType" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:set var="home" value="${symbol_dollar}{pageContext.request.contextPath}" scope="application" />
<c:set var="ot_version" value="3.0" scope="application" />
<jsp:useBean id="currentUser" class="org.opentides.util.SecurityUtil" scope="request"/>
<spring:theme code="client_name" var="client_name" scope="application" />
<spring:theme code="logo" var="logo" />
<spring:theme code="favicon" var="favicon" />

<html lang="${symbol_dollar}{pageContext.response.locale}">

<head>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <c:choose>
    	<c:when test="${symbol_dollar}{not empty pageTitle}">
			<title>${symbol_dollar}{client_name} - <spring:message code="${symbol_dollar}{pageTitle}" /></title>
    	</c:when>
    	<c:otherwise>
    		<title>${symbol_dollar}{client_name}</title>
    	</c:otherwise>
    </c:choose>
    
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='${symbol_dollar}{favicon}'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap-responsive.min.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footable-0.1.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap-notify.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/opentides-3.0.1.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/select2.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/datepicker.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap-modal.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/font-awesome.min.css'/>" />
    
	<script type="text/javascript" src="<c:url value='/js/jquery-1.9.0.min.js'/>"></script>	
	<script type="text/javascript" src="<c:url value='/js/jquery.deserialize.js'/>"></script>	
	<script type="text/javascript" src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/footable-0.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/bootstrap-notify.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/bootbox.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/select2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/bootstrap-datepicker.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/opentides-3.0.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/bootstrap-modal.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/bootstrap-modalmanager.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.form.js'/>"></script>
    
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    <jsp:doBody />

</head>
 
<body class="${symbol_dollar}{pageType}">

	<c:if test="${symbol_dollar}{pageType != 'modal-page'}">
    	<div class='notifications top-right'></div>
		<div id="wrap">
	</c:if>
	
	<c:choose>
		<c:when test="${symbol_dollar}{pageType eq 'modal-page'}">
			<!-- Do nothing -->
		</c:when>
		<c:when test="${symbol_dollar}{pageType eq 'anonymous-page'}">
			<div id="hd" class="navbar navbar-inverse">
				<div class="navbar-inner">
					<div class="container">
						<a class="brand" href="${symbol_dollar}{home}">
							<img class="logo" src="<c:url value='${symbol_dollar}{logo}'/>"/>
						</a>
					</div>
				</div>
			</div>
			<div class="main container">
		</c:when>
		<c:otherwise>
			<div id="nav" class="navbar navbar-inverse navbar-fixed-top">
				<div class="navbar-inner">
					<div class="container">
						<a class="btn btn-navbar" data-toggle="collapse"
							data-target=".nav-collapse"> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
						</a>
						<a class="brand" href="${symbol_dollar}{home}">
							<img class="logo" src="<c:url value='${symbol_dollar}{logo}'/>"/>
						</a>
						<div class="nav-collapse collapse">
							<ul class="nav">
								<li class="${symbol_dollar}{active eq 'home' ? 'active' : ''}">
									<a href="${symbol_dollar}{home}">
										<spring:message code="label.home"/>
									</a>
								</li>
								<li class="${symbol_dollar}{active eq 'users' ? 'active' : ''}">
									<a href="${symbol_dollar}{home}/organization/users/">
										<spring:message code="label.user"/>
									</a>
								</li>
								<li class="${symbol_dollar}{active eq 'system-codes' ? 'active' : ''}">
									<a href="${symbol_dollar}{home}/system/system-codes/">
										<spring:message code="label.system-codes"/>
									</a>
								</li>
								<li class="${symbol_dollar}{active eq 'usergroups' ? 'active' : ''}">
									<a href="${symbol_dollar}{home}/organization/usergroups/">
										<spring:message code="label.usergroup"/>
									</a>
								</li>
								<li class="${symbol_dollar}{active eq 'account-settings' ? 'active' : ''} hidden-desktop">
									<a href="${symbol_dollar}{home}/account-settings/"> 
										<spring:message code="label.account-settings"/>
									</a>
								</li>
								<li class="hidden-desktop">
									<a href="${symbol_dollar}{home}/logout"> 
										<spring:message code="label.logout"/>
									</a>
								</li>
							</ul>
						</div>
						<div class="btn-group pull-right hidden-tablet hidden-phone">
							<a class="btn dropdown-toggle btn-inverse" data-toggle="dropdown" href="${symbol_pound}">
								${symbol_dollar}{currentUser.user.username} <span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li class="${symbol_dollar}{active eq 'account-settings' ? 'active' : ''}">
									<a href="${symbol_dollar}{home}/account-settings/">
										<spring:message code="label.account-settings"/>
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href='${symbol_dollar}{home}/logout'>
										<spring:message code="label.logout"/>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div id="bd" class="container">
		</c:otherwise>
	</c:choose>
