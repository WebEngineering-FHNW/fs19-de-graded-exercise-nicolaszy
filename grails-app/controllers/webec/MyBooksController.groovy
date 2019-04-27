package webec

import grails.validation.Validateable
import mvc.SecRole
import mvc.SecUser
import mvc.SecUserSecRole

class MyBooksController {

    def createUsers(String userName, String password){

        SecUser nicolas = new SecUser(username: userName, password: password).save(flush:true)
        SecRole admin = new SecRole(authority: SecRole.ROLE_ADMIN).save(flush:true)
        new SecUserSecRole(secUser: nicolas, secRole: admin).save(flush:true)

        render view: 'myBooks', model: 'myBooksModel'
    }
}

class myBooksModel implements Validateable{


}

