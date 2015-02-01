import Quick
import Nimble

class StringExtensionsSpec: QuickSpec {
    
    override func spec() {
        
        describe("String extensions") {
            
            describe("as an extension of teh String class") {
                
                it("should be able to trim whitespaces from a regular string") {
                    
                    let stringWithSpaces = "   WHATTHAFOXSAYS  ";
                    
                    expect(stringWithSpaces.trim()).to(equal("WHATTHAFOXSAYS"))
                }
                
                it("should be able to trim any character from a regular string") {
                    
                    let stringWithSpaces = "123   WHATTHAFOXSAYS  456"
                    
                    expect(stringWithSpaces.trim(NSCharacterSet.decimalDigitCharacterSet())).to(equal("   WHATTHAFOXSAYS  "))
                }
            }
        }
    }
}
