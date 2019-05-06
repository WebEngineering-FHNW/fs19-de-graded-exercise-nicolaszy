package mvc

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class BookSpec extends Specification implements DomainUnitTest<Book> {

    Book b1
    Book b2
    Book b3

    def setup() {
        b1 = new Book(bookTitle: "To Kill a Mockingbird", isbn: "0060935464", rating: 2, id: 1).save(flush:true);
        b2 = new Book(bookTitle: "The Catcher in the Rye", isbn: "7543321726", rating: 2, id: 2).save(flush:true);
        b3 = new Book(bookTitle: "Go Set a Watchman: A Novel", isbn: "9780062409867", rating: 3, id: 3).save(flush:true);
    }

    def cleanup() {
        b1.delete()
        b2.delete()
        b3.delete()
    }

    void "find number of books with rating 2"() {
        when:
            List<Book> books = Book.findAllByRating(2)

        then:
            books.size() == 2
    }
}
