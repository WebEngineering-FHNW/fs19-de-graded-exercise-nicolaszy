package webec

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.Validateable
import mvc.Book
import mvc.SecRole
import mvc.SecUser
import mvc.SecUserSecRole

@Secured(SecRole.ROLE_ADMIN)
class MyBooksController {

    def index() {
        def books = Book.list()
        render view: 'MyBooks', model: [books:books]
    }

    def details(int id) {
        def book = Book.get(id)
        render view: 'DetailedView', model: [book:book]
        //http://localhost:8080/MyBooks/details?id=1
    }

    def changeBookDetails(int id, String title, String isbn, int rating){
        def book = Book.get(id)
        book.setBookTitle(title)
        book.setIsbn(isbn)
        book.setRating(rating)
        book.save(flush:true)
        def books = Book.list()
        render view: 'MyBooks', model: [books:books]
    }

    def add(){
        //id is a placeholder value and not actually used
        def book = new Book(bookTitle: "enter book title", isbn: "11111111111", rating: 3, id: 2).save(flush:true)
        render view: 'DetailedView', model: [book:book]
    }

}

class myBooksModel implements Validateable{

}

