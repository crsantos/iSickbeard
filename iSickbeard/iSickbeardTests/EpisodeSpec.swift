import Quick
import Nimble

class EpisodeSpec: QuickSpec {
    
    override func spec() {
        
        describe("an episode") {
            
            describe("as a representation of an episode of a tv show") {
                
                it("should be able to set its properties") {
                    
                    let episode = Episode(
                        
                        name: "name",
                        seasonNumber: 1,
                        airDate: NSDate(timeIntervalSinceReferenceDate: 12345)
                    )
                    
                    episode.updateSubtitles("   EN   ,   PT  , BR,FR")
                    
                    expect(episode.name).to(equal("name"))
                    expect(episode.seasonNumber).to(equal(1))
                    expect(episode.airdate).to(equal(NSDate(timeIntervalSinceReferenceDate: 12345)))
                    expect(episode.subtitles.count).to(equal(4))
                    expect(episode.subtitles.first).to(equal("EN"))
                    expect(episode.subtitles.last).to(equal("FR"))
                }
            }
        }
    }
}
