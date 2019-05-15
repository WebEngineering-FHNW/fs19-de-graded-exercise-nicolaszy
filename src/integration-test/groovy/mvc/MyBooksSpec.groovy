package mvc

import geb.spock.GebSpec
import grails.testing.mixin.integration.Integration
import grails.transaction.Transactional


/**
 * See http://www.gebish.org/manual/current/ for more instructions
 */
@Integration
class MyBooksSpec extends GebSpec {


    @Transactional
    void "Add a book"() {
        when:
            def count = Book.count()
            go "/login/auth"
        then:
            title == "Login"
        when:
            $("#username")[0].value("nicolas")
            $("#password")[0].value ("myPassword")
            $("input", type: "submit").click()
        then:
            title == "Welcome"

        when: "set valid input"
            go '/MyBooks/add'
            $("#isbn")[0].value("9780553801477")
            $("#rating")[0].value(5)
            $("input", type: "submit").click()

        then: "there is one more book now"
            assert Book.count() == count+1

    }
}
