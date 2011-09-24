<cfcomponent name="header">

	<cffunction name="getPageHeader" returntype="String">
		<cfsavecontent variable="page_header_html">
		<!DOCTYPE html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<link rel="stylesheet" href="/css/admin.css" type="text/css" media="screen" />
		</head>
		<body>
			<div class="banner">
				<div id="header">
					<h1 id="site-header">
						<a href="/">
							<img src="/gfx/livewirelogo.png" />
						</a>
					</h1>
					<br clear="all" />
				</div>
			</div>
		</cfsavecontent>
		<cfreturn page_header_html />
	</cffunction>

	<cffunction name="getPageFooter" returntype="String">
		<cfsavecontent variable="page_footer_html">
		<div id="footer">&nbsp;
		</div>
		</body>
		</cfsavecontent>
		<cfreturn page_footer_html />
	</cffunction>
</cfcomponent>