<cfif isDefined("form.password") and isDefined("form.username")>
	<cfset coldspringConfig = '#request.appPath#/conf/login.xml' />
	<cfset properties.username = form.username />
	<cfset properties.password = form.password />
	<cfset beanFactory = CreateObject('component', 'coldspring.beans.DefaultXmlBeanFactory').init(defaultProperties=properties) />  
	<cfset beanFactory.loadBeans(coldspringConfig) />
	<cfset session.user = beanFactory.getBean('user') />
	<cfset login = beanFactory.getBean('login').login() />
	<cfif session.user.isAdmin()>
		<cfset session.admin_user = session.user />
		<cflocation url="home.cfm" />
	<cfelse>
		<cfset structDelete(session, "admin_user") />
	</cfif>
</cfif>
<cfparam name="form.username" default="" />
<cfset header = createObject("component", "com.admin.header") />
	 <cfoutput>
   #header.getPageHeader()#
Please log in:
<div>
<form action="" method="post">
	 <input type="text" name="username" id="username" value="#form.username#" />
	<input type="password" name="password" id="password" />
	<input type="submit" value="login" />
</form>
</div>
	 #header.getPageFooter()#
</cfoutput>