package mvc


class Book {

    String bookTitle
    String isbn
    int rating
    String username


    static constraints = {

        bookTitle minSize: 2
        isbn minSize: 10, maxSize: 13
        rating inList: [1,2,3,4,5]
        username minSize: 2
    }
}
