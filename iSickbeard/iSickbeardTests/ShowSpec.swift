import Quick
import Nimble

class ShowSpec: QuickSpec {
    
    override func spec() {
        
        describe("a show") {
            
            describe("as a representation of a tv show") {
                
                it("should be able to set its properties") {

                    let show = Show(
                        name: "name",
                        indexerId: 12314,
                        airs: "Sunday, 8/9Central",
                        location: "/",
                        quality: QualitySetting.QualitySetting1080pBluRay
                    )
                    
                    expect(show.name).to(equal("name"))
                    expect(show.quality).to(equal(QualitySetting.QualitySetting1080pBluRay))
                    expect(show.indexerId).to(equal(12314))
                    expect(show.location).to(equal("/"))
                    expect(show.airs).to(equal("Sunday, 8/9Central"))
                }
            }
        }
    }
}
