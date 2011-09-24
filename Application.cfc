 <cfcomponent
 output="false"
 hint="I define the application settings and event handlers.">
  
 <cfset this.name = "LiveWireCMS" />
  
 <cfset this.sessionManagement = true />

<cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 0, 1, 0 ) />
  
  <cfset request.datasource = "LiveWireCMSDSN" />
  <Cfset request.salt = "{},.;'[[]'Ag67(*3:~@_+9876%%34" />

	<cfset request.admin_path="/livewire-admin" />

<cfset request.appPath = replaceNoCase(GetCurrentTemplatePath(), "application.cfc", "") />
 <cffunction
 name="onApplicationStart"
 access="public"
 returntype="boolean"
 output="false"
 hint="I initialize the application.">
  
 <!--- Set some app variables for testing. --->
 <cfset application.dateInitialized = now() />
  <!---<cfset application.datasource="LiveWireCMSDSN" />--->
  
 <!--- Return true so the page can process. --->
 <cfreturn true />
 </cffunction>
  
  
 <cffunction
 name="onRequestStart"
 access="public"
 returntype="boolean"
 output="false"
 hint="I initialize the request.">
 
 <!--- Set some request variables for testing. --->
 <cfset request.dateInitialized = now() />
 <!--- Return true so the page can process. --->
 <cfreturn true />
 </cffunction>
  
  
 <cffunction
 name="onRequest"
 access="public"
 returntype="void"
 output="true"
 hint="I process the user's request.">
  
 <!--- Define arguments. --->
 <cfargument
 name="script"
 type="string"
 required="true"
 hint="I am the request script."
 />
  
 <!--- Return out. --->
 <cfreturn />
 </cffunction>
  
 </cfcomponent>

<!---<cfcomponent name="Application" output="true">

	<cfset this.name = "LiveWireCMS" />

	<cfset application.datasource="LiveWireCMSDSN" />

	<cfset request.appPath = replaceNoCase(GetCurrentTemplatePath(), "application.cfc", "") />

<cffunction
name="onApplicationStart"
access="public"
returntype="boolean"
output="false"
hint="I initialize the application.">
 
<!--- Set some app variables for testing. --->
<cfset application.dateInitialized = now() />
 
<!--- Return true so the page can process. --->
<cfreturn true />
</cffunction>
</cfcomponent>--->