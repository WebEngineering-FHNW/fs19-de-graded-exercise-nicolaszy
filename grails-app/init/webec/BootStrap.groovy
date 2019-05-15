package webec

import grails.util.Environment
import mvc.Book
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

        String[] books = ["0765342294", "0425201686", "0671461494", "9781594633669", "0006479898"]
        new Book(bookTitle: "Ender's Game", isbn: books[0], username: "standardUser", rating: 4, author: "Orson Scott Card").save(flush:true)
        new Book(bookTitle: "Tom Clancy's splinter cell", isbn: books[1], username: "standardUser", rating: 3, author: "Tom Clancy").save(flush:true)
        new Book(bookTitle: "The Hitchhiker's Guide to the Galaxy", isbn: books[2], username: "standardUser", rating: 5, author: "Michael Douglas").save(flush:true)
        new Book(bookTitle: "The Girl On the Train", isbn: books[3], username: "standardUser", rating: 5, author: "Paula Hawkins").save(flush:true)
        new Book(bookTitle: "A Clash of Kings", isbn: books[4], username: "standardUser", rating: 4, author: "George R. R. Martin").save(flush:true)
    }
    def destroy = {
    }
}
