package webec

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

import grails.validation.Validateable
import mvc.Book
import mvc.SecRole
import mvc.SecUser
import mvc.SecUserSecRole
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder

@Secured(SecRole.ROLE_ADMIN)
class MyBooksController {

    def index() {
        def books = Book.list()
        render view: 'MyBooks', model: [books:books]
    }

    //gets a book by its id and renders it in detailed view
    def details(int id) {
        def book = Book.get(id)
        render view: 'DetailedView', model: [book:book]
    }

    //gets a book by id, changes information according to user input
    def changeBookDetails(int id, String title, String isbn, int rating){
        def book = Book.get(id)
        book.setBookTitle(title)
        book.setIsbn(isbn)
        book.setRating(rating)
        book.save(flush:true)
        //get all books again, render the "My Books" View with all books including the new one
        def books = Book.list()
        render view: 'MyBooks', model: [books:books]
    }

    def add(){
        //get the current logged in user
        //used https://www.baeldung.com/get-user-in-spring-security (tutorial for spring security)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication()

        //id is a placeholder value and not actually used; it is generated automatically, but needs to be given as a parameter
        def book = new Book(bookTitle: "enter book title", isbn: "enter an isbn", rating: 3, id: 2, username: authentication.getName()).save(flush:true)
        print(book.getUsername())
        render view: 'DetailedView', model: [book:book]
    }

}

class myBooksModel implements Validateable{

}

