package mvc

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class SecRole implements Serializable {

	private static final long serialVersionUID = 1
	public static final String ROLE_ADMIN = "ROLE_ADMIN"
	public static final String ROLE_USER = "ROLE_USER"

	String authority

	static constraints = {
		authority nullable: false, blank: false, unique: false
	}

	static mapping = {
		cache true
	}
}
