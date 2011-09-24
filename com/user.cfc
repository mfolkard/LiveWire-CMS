<cfcomponent name="user">
	<cffunction name="init" access="public">
		<cfargument name="username" type="string" required="yes" />
		<cfargument name="password" type="string" required="yes" />
		<cfset variables.instance['username'] = arguments.username />
		<cfset variables.instance['password'] = arguments.password />
   		<cfset variables.instance['keys'] = "" />
		<cfset variables.instance['is_admin'] = false />
	</cffunction>
   
	<cffunction name="getUsername" access="public" returntype="string">
   		<cfreturn variables.instance["username"] />
   </cffunction>

   <cffunction name="getPassword" returntype="string">
   		<cfreturn variables.instance["password"] />
   </cffunction>

   <cffunction name="isAdmin" returntype="string">
   		<cfreturn variables.instance["is_admin"] />
   </cffunction>

   <cffunction name="getKeys" access="public" returntype="string">
   		<cfreturn variables.instance["keys"] />
   </cffunction>

   <cffunction name="setKeys" access="public" returntype="string">
   		<cfargument name="key_list" type="String" required="true" />
   		<cfif listFind(arguments.key_list, 1)><!--- if they have the global admin key, then set them to be admins--->
   			<cfset setAdmin(true) />
		</cfif>
   		<cfset variables.instance["keys"] = arguments.key_list />
   </cffunction>

   <cffunction name="setAdmin" returntype="string">
		<cfargument name="is_admin" type="boolean" required="false" default="true" />
   		<cfreturn variables.instance["is_admin"] = true />
   </cffunction>
</cfcomponent>