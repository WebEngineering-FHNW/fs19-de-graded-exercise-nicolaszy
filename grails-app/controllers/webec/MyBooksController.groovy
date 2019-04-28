package webec

import grails.validation.Validateable
import mvc.Book
import mvc.SecRole
import mvc.SecUser
import mvc.SecUserSecRole

class MyBooksController {

    def index() {
        def books = Book.list()
        render view: 'MyBooks', model: [books:books]
    }


}

class myBooksModel implements Validateable{

}

