<cfset coldspringConfig = 'conf/login.xml' />
<cfset properties.username = "mfolkard" />
<cfset properties.password = "ggverdis" />
<cfset beanFactory = CreateObject('component', 'coldspring.beans.DefaultXmlBeanFactory').init(defaultProperties=properties	) />  
<cfset beanFactory.loadBeans(coldspringConfig) />

<cfset user = beanFactory.getBean('user') />      

<cfset login = beanFactory.getBean('login') />

<cfoutput>#login.login()#</cfoutput>