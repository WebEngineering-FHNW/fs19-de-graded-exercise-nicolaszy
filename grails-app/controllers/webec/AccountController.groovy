package webec

import grails.validation.Validateable
import mvc.SecRole
import mvc.SecUser
import mvc.SecUserSecRole

class AccountController {

    def index(){
        createUsersView()
    }
    def createUsersView(){
        render view: 'accounts', model: 'AccountModel'
    }

    def createUsers(String userName, String password){

        SecUser user = new SecUser(username: userName, password: password).save(flush:true)
        SecRole admin = new SecRole(authority: SecRole.ROLE_ADMIN).save(flush:true)
        new SecUserSecRole(secUser: user, secRole: admin).save(flush:true)

        redirect(controller:"MyBooks",action:"index")
    }
}

class AccountModel implements Validateable{

}

