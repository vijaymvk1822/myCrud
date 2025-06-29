<cfcomponent>
   <cfproperty name="dsn" inject="coldbox:setting:mydsn" />


   <cffunction name="getUserList"  returntype="any" output="false" httpmethod="get">
      <cfquery name="qUsers" datasource="#dsn.name#">
        SELECT id, name, age, address FROM userlist
      </cfquery>
    <cfreturn qUsers>
  </cffunction>

    

 <cffunction name="insertUserList" access="public" output="false">
    <!--- Define arguments --->
    <cfargument name="name" type="string" required="true">
    <cfargument name="age" type="string" required="true">
    <cfargument name="address" type="string" required="true">

    <!--- Insert Query --->
    <cfquery name="insertUser" datasource="#dsn.name#" >
        INSERT INTO userlist (name, age, address)
        VALUES (
            <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#arguments.age#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">
        )
    </cfquery>
</cffunction>

<cffunction name="deleteUserData">
  <cfargument name="userId"  type="number" required="true">
    <cfquery name="deleteUserData" datasource="#dsn.name#">
      DELETE FROM userlist WHERE 
          id  = <cfqueryparam  value="#arguments.userId#" cfsqltype="cf_sql_int" > 
    </cfquery>
</cffunction>

<cffunction name="getUserById">
  <cfargument name="userId"  type="number" required="true">
   <cfquery name="userList" datasource="#dsn.name#">
    SELECT * FROM userlist
    WHERE 
        id = <cfqueryparam  value="#arguments.userId#" cfsqltype="cf_sql_int" > 
   </cfquery>
   <cfreturn userList>
</cffunction>

<cffunction name="updateUser">
    <cfargument name="userId"  type="number" required="true">
    <cfargument name="name"  type="string" required="true">
    <cfargument name="age"  type="number" required="true">
    <cfargument name="address"  type="string" required="true">

    <cfquery name="updateUsers" datasource="#dsn.name#">
      UPDATE userlist 
      SET 
        name = <cfqueryparam  value="#arguments.name#" cfsqltype="cf_sql_varchar">,
        age = <cfqueryparam  value="#arguments.age#" cfsqltype="cf_sql_int">,
        address = <cfqueryparam  value="#arguments.address#" cfsqltype="cf_sql_varchar">
      WHERE id = <cfqueryparam  value="#arguments.userId#" cfsqltype="cf_sql_int" > 
    </cfquery>

</cffunction>
</cfcomponent>