package webec

import mvc.Book

import grails.plugin.springsecurity.annotation.Secured
import mvc.SecRole

@Secured(SecRole.ROLE_ADMIN)
class BookController {

    static scaffold = Book

}
