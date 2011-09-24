<cfcomponent name="login">
	<cffunction name="init" returntype="any">
		<cfargument name="user" type="com.user" required="yes" />
		<cfset variables.instance["user"] = arguments.user />
		<cfreturn this />
	</cffunction>

	<cffunction name="login" returntype="boolean">
		<cfset is_logged = false />
   		<cfquery name="getUser" datasource="#request.datasource#" maxrows="1">
   			select id from lw_users
   			where username like 
				<cfqueryparam value="#variables.instance["user"].getUsername()#" CFSQLType="CF_SQL_VARCHAR" maxLength="100" />
			and password like
   				<cfqueryparam value="#hash(variables.instance["user"].getPassword())#" CFSQLType="CF_SQL_VARCHAR" maxLength="100" />
   		</cfquery>
   		<cfif getUser.recordcount>
   			<cfset is_logged = true />
   			<cfquery name="getUserKeys" datasource="#request.datasource#">
   				select keyid
   				from lw_users_keys
   				where userid = <cfqueryparam value="#getUser.id#" CFSQLType="CF_SQL_INTEGER"  />
			</cfquery>
   			<cfset variables.instance["user"].setKeys(valueList(getUserKeys.keyid)) />
   		</cfif>
		<!---<cfif (variables.instance["user"].getUsername() eq "mfolkard" and variables.instance["user"].getPassword() eq "ggverdi")>
			<cfset variables.instance["user"].setAdmin() />
			<cfset is_logged = true />
		<cfelseif variables.instance["user"].getUsername() eq "user" and variables.instance["user"].getPassword() eq "password">
			<cfset is_logged = true />
		</cfif>--->
		<cfreturn is_logged />
	</cffunction>
</cfcomponent>