<cfinclude template="../Application.cfc" />

<cffunction name="onRequestStart" access="public" output="true">
	<cfargument name="targetPage" type="String" required="true" />
	<cfif arguments.targetPage eq "/index.cfm" or arguments.targetPage eq "/install.cfm"><!--- You don't need to be logged in to see the index page--->
		<cfreturn true />
	</cfif>
	<cfif not isDefined("session.admin_user")>
		<cflocation url="index.cfm" />
	</cfif>
</cffunction>

<!---
<cfloop
item="key"
collection="#variables#">
 
<!--- Chectk for a "local" method. --->
<cfif reFind( "^_", key )>
 
<!--- Copy oritinal reference into the fake super scope. --->
<cfset super[ listFirst( key, "_" ) ] = variables[ listFirst( key, "_" ) ] />
 
<!--- Now, move the "_" method in the main CFC scopes. --->
<cfset this[ listFirst( key, "_" ) ] = this[ key ] />
<cfset variables[ listFirst( key, "_" ) ] = variables[ key ] />
 
</cfif>
 
</cfloop>--->