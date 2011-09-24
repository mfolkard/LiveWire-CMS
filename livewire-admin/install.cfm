<cfset header = createObject("component", "com.admin.header") />
<cfparam name="url.step" type="numeric" default="0" />
<cfoutput>
	#header.getPageHeader()#
	<cfif url.step eq 0>
		Welcome to LiveWire CMS. The configurable content management system.
		
		<cfquery name="checkInstall" datasource="#request.datasource#">
			show tables like 'lw_users'
		</cfquery>
		<cfif checkInstall.recordcount><!--- Detected a previous install --->
			Previous install detected. Overwrite?? <a href="?step=1">Yes</a>
		<cfelse>
			No previous install has been detected. Install a new system?? <a href="?step=1">Yes</a>
		</cfif>
	<cfelseif url.step eq 1>
		
		<cfquery name="createUsers" datasource="#request.datasource#">
			drop table if exists lw_users;
			CREATE TABLE `lw_users` (
			  `id` int(11) NOT NULL auto_increment,
			  `username` varchar(100) default NULL,
			  `password` varchar(100) default NULL,
			  PRIMARY KEY  (`id`)
			) ENGINE=MyISAM DEFAULT CHARSET=latin1
		</cfquery>
		<cfquery name="createKeys" datasource="#request.datasource#">
			drop table if exists lw_keys;
			CREATE TABLE `lw_keys` (
			  `id` int(11) NOT NULL auto_increment,
			  `name` varchar(100) default NULL,
			  PRIMARY KEY  (`id`)
			) ENGINE=MyISAM DEFAULT CHARSET=latin1
		</cfquery>
		<cfquery name="insertKeys" datasource="#request.datasource#">
			insert into lw_keys (name) values ('Global Administrator')
		</cfquery>
		<cfquery name="createUsersKeys" datasource="#request.datasource#">
			drop table if exists lw_users_keys;
			CREATE TABLE `lw_users_keys` (
			  `userid` int(11) NOT NULL,
			  `keyid` int(11) NOT NULL
			) ENGINE=MyISAM DEFAULT CHARSET=latin1
		</cfquery>

		<cfquery name="createObjects" datasource="#request.datasource#">
			drop table if exists lw_objects;
			CREATE TABLE `lw_objects` (
			  `id` int(11) NOT NULL auto_increment,
			  `name` varchar(100) default NULL,
			  PRIMARY KEY  (`id`)
			) ENGINE=MyISAM DEFAULT CHARSET=latin1
		</cfquery>

		<cfquery name="createObjectFieldss" datasource="#request.datasource#">
			drop table if exists lw_object_fields;
			CREATE TABLE `lw_object_fields` (
			  `id` int(11) NOT NULL auto_increment,
			  `object_id` int(11) NOT NULL,
			  `name` varchar(100) default NULL,
			  PRIMARY KEY  (`id`)
			) ENGINE=MyISAM DEFAULT CHARSET=latin1
		</cfquery>
		<cflocation url="?step=2" />
	<cfelseif url.step eq 2>
		Please enter an administrator password:
		<form action="?step=3" method="post">
			<input type="password" name="password" id="password" />
			<input type="submit" />
		</form>
	<cfelseif url.step eq 3>
		<cfset password_value = hash(form.password) />
		<cfquery name="insertAdmin" datasource="#request.datasource#">
			insert into lw_users (username, password)
			values
			(
				'Global Administrator',
				<cfqueryparam value="#password_value#" CFSQLType="CF_SQL_VARCHAR" maxLength="100" />
			 );
			select last_insert_id() as last_id;
		</cfquery>
		<cfquery name="insertAdmin" datasource="#request.datasource#">
			insert into lw_users_keys (userid, keyid)
			values
			(
				<cfqueryparam value="#insertAdmin.last_id#" CFSQLType="CF_SQL_INTEGER" />,
				<cfqueryparam value="1" CFSQLType="CF_SQL_INTEGER" />
			 )
		</cfquery>
			  <cfset redirectToLogin() />
	</cfif>
	#header.getPageFooter()#
</cfoutput>

<cffunction name="redirectToLogin">
	<cflocation url="#request.admin_path#" />
</cffunction>