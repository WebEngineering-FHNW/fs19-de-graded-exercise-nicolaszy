package mvc


class Book {

    String bookTitle
    String isbn
    int rating
    String username
    String author
    boolean recommendation = false


    static constraints = {

        bookTitle minSize: 2
        isbn minSize: 10, maxSize: 13
        rating inList: [0,1,2,3,4,5]
        username minSize: 2
        //author will be initalized as null and then added based on isbn, so it should be nullable
        author nullable: true
    }
}
