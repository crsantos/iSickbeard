import Quick
import Nimble
import SwiftyJSON

class ShowSpec: QuickSpec {
    
    override func spec() {
        
        describe("a show") {
            
            describe("as a representation of a tv show") {
                
                it("should be able to set its properties") {

                    let show = Show(
                        name: "name",
                        indexerId: 12314,
                        airs: "Sunday, 8/9Central",
                        quality: QualitySetting.QualitySetting1080pBluRay
                    )
                    
                    expect(show.name).to(equal("name"))
                    expect(show.quality).to(equal(QualitySetting.QualitySetting1080pBluRay))
                    expect(show.indexerId).to(equal(12314))
                    expect(show.airs).to(equal("Sunday, 8/9Central"))
                }
                
                it("should be convertible from a Dictionary") {
                    
                    let dict = [
                        "airs": "Friday 9:00 PM",
                        "anime": 0,
                        "archive_firstmatch": 0,
                        "cache": [
                            "banner": 1,
                            "poster": 1
                        ],
                        "dvdorder": 0,
                        "flatten_folders": 1,
                        "genre": [
                            "Science-Fiction"
                        ],
                        "indexerid": 272644,
                        "language": "en",
                        "location": "/downloads/complete/tvshows/12 Monkeys",
                        "network": "Syfy",
                        "next_ep_airdate": "2015-02-06",
                        "paused": 0,
                        "quality": "HD",
                        "quality_details": [
                            "archive": [],
                            "initial": [
                            "hdtv",
                            "fullhdtv",
                            "hdwebdl",
                            "fullhdwebdl",
                            "hdbluray",
                            "fullhdbluray"
                            ]
                        ],
                        "rls_ignore_words": [], 
                        "rls_require_words": [], 
                        "scene": 0, 
                        "season_list": [
                            1, 
                            0
                        ], 
                        "show_name": "12 Monkeys", 
                        "sports": 0, 
                        "status": "Continuing", 
                        "subtitles": 1, 
                        "tvdbid": 272644, 
                        "tvrage_id": 36903, 
                        "tvrage_name": "12 Monkeys"
                    ]
                    
                    let show = Show.convertFromDictionary(JSON(dict))
                    
                    expect(show!.name).to(equal("12 Monkeys"))
                    expect(show!.quality).to(equal(QualitySetting.QualitySettingHD))
                    expect(show!.indexerId).to(equal(272644))
                    expect(show!.airs).to(equal("Friday 9:00 PM"))
                }
            }
        }
    }
}
