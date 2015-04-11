import Quick
import Nimble

class DictionaryExtensionSpec: QuickSpec {
    
    override func spec() {
     
        describe("Dictionary extensions") {
            
            describe("as an extension of the Dictionary class") {
                
                it("should be able to copy keys and values from an array and create a new one with the new keys") {
                    
                    let dict:Dictionary<String, String> = ["one":"1", "two": "2", "three": "3"]
                    let copiedDict = Dictionary<String,String>.pick(dict, keys: "one", "three")
                    
                    expect(count(copiedDict.keys)).to(equal(2))
                    expect(copiedDict["one"]).to(equal("1"))
                    expect(copiedDict["three"]).to(equal("3"))
                }
            }
        }
    }
}
