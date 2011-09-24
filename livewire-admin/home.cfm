<cfset header = createObject("component", "com.admin.header") />
<cfoutput>
   #header.getPageHeader()#
this is the home page and you need to log in
#header.getPageFooter()#
</cfoutput>