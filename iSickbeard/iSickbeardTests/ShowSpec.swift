import Quick
import Nimble

class ShowSpec: QuickSpec {
    
    override func spec() {
        
        describe("a show") {
            
            describe("as a representation of a tv show") {
                
                it("should be able to set its properties") {
                    
                    let show = Show(
                        name: "name",
                        quality: QualitySetting.QualitySetting1080pBluRay
                    )
                    
                    expect(show.name).to(equal("name"))
                    expect(show.quality).to(equal(QualitySetting.QualitySetting1080pBluRay))
                }
            }
        }
    }
}
