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

@Secured([SecRole.ROLE_ADMIN, SecRole.ROLE_USER])
class MyBooksController {

    def index() {
        //get book of current logged in user
        //used https://www.baeldung.com/get-user-in-spring-security (tutorial for spring security)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication()
        def books = Book.findAllByUsernameAndRecommendation(authentication.getName(),false).asList()
        render view: 'MyBooks', model: [books:books]
    }

    //gets a book by its id and renders it in detailed view
    def details(int id) {
        def book = Book.get(id)
        render view: 'DetailedView', model: [book:book]
    }

    //gets a book by its id and renders it in detailed view in edit mode
    def edit(int id) {
        def book = Book.get(id)
        render view: 'EditView', model: [book:book]
    }

    //gets a book by id, changes information according to user input
    def changeBookDetails(int id, String title, String isbn, int rating, String author){
        def book = Book.get(id)
        book.setBookTitle(title)
        book.setIsbn(isbn)
        book.setRating(rating)
        book.setAuthor(author)
        book.save(flush:true)
        //get all books of the current user again, render them in a table
        //used https://www.baeldung.com/get-user-in-spring-security (tutorial for spring security)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication()
        def books = Book.findAllByUsername(authentication.getName()).asList()
        render view: 'MyBooks', model: [books:books]
    }

    def add(){
        //get the current logged in user
        //used https://www.baeldung.com/get-user-in-spring-security (tutorial for spring security)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication()

        //id is a placeholder value and not actually used; it is generated automatically, but needs to be given as a parameter
        def book = new Book(bookTitle: "enter book title", isbn: "enter an isbn", rating: 3, id: 2, username: authentication.getName(), author: null, recommendation: false).save(flush:true)
        render view: 'EditView', model: [book:book]
    }

}

class myBooksModel implements Validateable{

}

