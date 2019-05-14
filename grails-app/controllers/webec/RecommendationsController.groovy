package webec

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.Validateable
import mvc.Book
import mvc.SecRole
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder

@Secured([SecRole.ROLE_ADMIN, SecRole.ROLE_USER])
class RecommendationsController {

    def index() {
        //get book of current logged in user
        //used https://www.baeldung.com/get-user-in-spring-security (tutorial for spring security)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication()
        def books = Book.findAllByUsernameAndRecommendation(authentication.getName(), false).asList()
        render view: 'RecommendationsLoad', model: [books:books]
    }

    //gets a book by id, changes information according to user input
    def addBook(String isbn){
        def book = Book.findByIsbn(isbn)
        book.setRecommendation(false)
        book.save(flush:true)
        //get all books of the current user again, render them in a table
        //used https://www.baeldung.com/get-user-in-spring-security (tutorial for spring security)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication()
        def books = Book.findAllByUsernameAndRecommendation(authentication.getName(),true).asList()
        //redirect(controller:"MyBooks",action:"index")
        render view: 'Recommendations', model: [books:books]
    }

    def addRecommendedWithIsbn(String title, String isbn, String authorName){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication()

        if (Book.findAllByBookTitle(title).size() == 0) {
            new Book(bookTitle: title, isbn: isbn, rating: 3, id: 0, username: authentication.getName(), author: authorName, recommendation: true).save(flush: true)
        }
        render(status: 200)
    }

    def RecommendationsList() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication()

        def books = Book.findAllByUsernameAndRecommendation(authentication.getName(), true).asList()
        render view: 'Recommendations', model: [books:books]
    }
}

class RecommendationsModel implements Validateable{

}

