package webec

import grails.util.Environment
import mvc.SecRole
import mvc.SecUser
import mvc.SecUserSecRole

class BootStrap {

    def init = { servletContext ->
        //on production do not set up the same security accounts
        //if (Environment.current == Environment.PRODUCTION) return;

        SecUser nicolas = new SecUser(username: "nicolas", password: "myPassword").save(flush:true)
        SecRole admin = new SecRole(authority: SecRole.ROLE_ADMIN).save(flush:true)
        new SecUserSecRole(secUser: nicolas, secRole: admin).save(flush:true)

        SecUser standardUser = new SecUser(username: "standardUser", password: "pw").save(flush:true)
        SecRole user = new SecRole(authority: SecRole.ROLE_USER).save(flush:true)
        new SecUserSecRole(secUser: standardUser, secRole: user).save(flush:true)
    }
    def destroy = {
    }
}
