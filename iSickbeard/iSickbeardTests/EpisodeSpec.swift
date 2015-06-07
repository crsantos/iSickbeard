import Quick
import Nimble
import SwiftyJSON

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
                
                it("should properly parse and build itself from a dictionary") {
                    
                    let dict = [
                        
                        "airs": "Tuesday, 9:00 PM",
                        "airdate": "2015-01-23",
                        "file_size": 0,
                        "location": "",
                        "name": "Out of Time: Self Portrait",
                        "quality": "N/A",
                        "release_name": "",
                        "status": "Wanted",
                        "season": "1",
                        "subtitles": "",
                        "show_name": "12 Monkeys",
                        "show_status": "Continuing",
                        "indexerid": 263365,
                        "tvdbid": 263365
                    ]
                    
                    let episode = Episode.convertFromDictionary(JSON(dict))
                    
                    expect(episode!.name).to(equal("Out of Time: Self Portrait"))
                    expect(episode!.quality).to(equal(QualitySetting.QualitySettingNA))
                    expect(episode!.location).to(equal(""))
                    expect(episode!.airdate).to(equal(Episode.simpleDateFormatter.dateFromString("2015-01-23")))
                    expect(episode!.airs).to(equal(Episode.nextWeekdayDateFormatter.dateFromString("Tuesday, 9:00 PM")))
                    expect(episode!.show!.status).to(equal("Continuing"))
                }
            }
        }
    }
}
