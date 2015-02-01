import Quick
import Nimble

class ServerSpec: QuickSpec {
    
    override func spec() {
        
        describe("a server") {
            
            describe("as a sickbeard machine") {
                
                it("should have loud") {
                    
                    let server = Server(
                        name: "name",
                        address: "address",
                        apiKey: "apikey"
                    )
                    
                    expect(server.name).to(equal("name"))
                    expect(server.address).to(equal("address"))
                    expect(server.apiKey).to(equal("apikey"))
                }
            }
        }
    }
}
