/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	property name = crudDAO inject ="model:crudModel";


	function nameList( event, rc, prc ){

		

		if(structKeyExists(rc,"submit")){

			if(structkeyExists(rc,"id")){
				rc.updateUser = crudDAO.updateUser(userId = rc.id,name = rc.name,age = rc.age,address = rc.address);
				
			}else{
				c.insertUserList = crudDAO.insertUserList(name=rc.name,age=rc.age,address=rc.address);
			}
			// location( event.buildLink( 'crud.nameList' ), false );
		}

		if(structKeyExists(rc,"id") && (structKeyExists(rc,"delete") && rc.delete EQ 'true')){
			rc.deleted = crudDAO.deleteUserData(userId = rc.id);
			location( event.buildLink( 'crud.nameList' ), false );
		}
		 
		prc.getUserData = crudDAO.getUserList();
	}

}
