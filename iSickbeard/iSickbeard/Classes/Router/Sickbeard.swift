//
//  Sickbeard.swift
//  iSickbeard
//
//  Created by Carlos Santos on 01/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Alamofire
import SwiftyJSON

public enum Status {
    
    case Success
    case Failure
}

public class Response {

    public var status: Status  = .Failure
    public var object: JSON?   = nil
    public var error: NSError? = nil
}

struct Sickbeard {
    
    // MARK: - Properties
    
    var server:Server{
        
        get {
            
            return Router.currentServer!
        }
        
        set (aNewValue) {
            
            Router.currentServer = aNewValue
        }
    }
    
    // MARK: - Lifecycle
    
    init(server:Server){
        
        self.server = server
    }
    
    // MARK: - API calls
    
    func pingServer(completion:(response: Response)->()) -> Request {
        
        let request = self.requestBuilder(Sickbeard.Router.Ping(), completionBlock: { (response) -> () in
            
            completion(response: response)
        })
        
        return request
    }
    
    func ShowList(completion:(response: Response, shows: Array<Show>)->()) -> Request {
        
        let request = self.requestBuilder(Sickbeard.Router.ShowList(), completionBlock: { (response) -> () in
            
            var shows:Array<Show> = Array<Show>()
            if let data:Dictionary<String,JSON> = response.object?[JSONConstants.GeneralKeys.jsonDataKey].dictionaryValue {
                
                var list:Array<JSON> = Array(data.values)
                
                for jsonShow:JSON in list{
                    
                    if let show = Show.convertFromDictionary(jsonShow){
                    
                        shows.append(show)
                    }
                }
            }
            
            completion(response: response, shows: shows)
        })
        
        return request
    }
    
    func History(limit:Int16, completion:(response: Response, episodes: Array<Episode>)->()) -> Request {
        
        let request = self.requestBuilder(Sickbeard.Router.History(limit), completionBlock: { (response) -> () in
            
            var episodes:Array<Episode> = Array<Episode>()
            if let data:[JSON] = response.object?[JSONConstants.GeneralKeys.jsonDataKey].arrayValue {
                
                var list:Array<JSON> = Array(data)
                
                for jsonShow:JSON in list{
                    
                    if let episode = Episode.convertFromDictionary(jsonShow){
                        
                        episodes.append(episode)
                    }
                }
            }
            
            completion(response: response, episodes: episodes)
        })
        
        return request
    }
    
    // MARK: - Private methods
    
    func requestBuilder(type: Router, completionBlock:(response: Response)->()) -> Request {
        
        let request = Alamofire.request(type).validate()
            .responseJSON { (_, _, json, error) in
                
                completionBlock(
                    
                    response: self.responseBuilder(JSON(json!), error: error)
                )
        }
        return request
    }
    
    func responseBuilder(object: JSON?, error: NSError?) -> Response {
        
        var response = Response()
        
        if error != nil {
            
            response.status = .Failure
            
        } else{
            
            response.status = .Success
        }
        
        response.error = error
        response.object = object

        return response
    }
    
    // MARK: - Routing
    
    enum Router: URLRequestConvertible {
        
        static var currentServer: Server?
        
        // MARK: Possible Routes
        
        case Ping()
        case ShowList()
        case History(Int16)
        case ShowSeasons(Int64)
        case ShowPoster(Int64)
        
        
        // MARK: HTTP Method
        var method: Alamofire.Method {
            
            switch self {
            
            default:
                
                return .GET
            }
        }
        
        // MARK: URLRequestConvertible
        
        var URLRequest: NSURLRequest {
            
            var currentServer:Server?
            
            assert(currentServer == nil, "You did not provide a server")
            
            if let server = Router.currentServer {
                
                currentServer = server
                
            }
            
            let (operation: String, parameters: [String: String]) = {
                
                switch self {
                    
                case .Ping:
                    
                    return ("sb.ping", [:])
                    
                case .ShowList:
                    
                    return ("shows", [:])
                    
                case .History(let limit):
                    
                    return ("history", ["limit" : String(limit)])

                case .ShowSeasons(let indexerId):
                    
                    return ("show.seasons", ["indexerid" : String(indexerId)])
                    
                case .ShowPoster(let indexerId):
                    
                    return ("show.getposter", ["indexerid" : String(indexerId)])
                
                }
                
                }()
            
            let apiPath = "\(currentServer!.address)/api/\(currentServer!.apiKey)"
            let URL = NSURL(string: apiPath)!
            let mutableURLRequest = NSMutableURLRequest(URL: URL)
            parameters

            var mutableParameters = [ "cmd" :operation]
            
            for (key, value) in parameters { // copy
            
                mutableParameters[key] = value
            }
            
            mutableURLRequest.HTTPMethod = method.rawValue
            let encoding = Alamofire.ParameterEncoding.URL
            
            return encoding.encode(mutableURLRequest, parameters: mutableParameters).0
        }
    }
}

extension Alamofire.Request {
    
    class func imageResponseSerializer() -> Serializer {
        
        return { request, response, data in
            
            if data == nil {
                
                return (nil, nil)
            }
            
            let image = UIImage(data: data!, scale: UIScreen.mainScreen().scale)
            
            return (image, nil)
        }
    }
    
    func responseImage(completionHandler: (NSURLRequest, NSHTTPURLResponse?, UIImage?, NSError?) -> Void) -> Self {
        
        return response(serializer: Request.imageResponseSerializer(), completionHandler: { (request, response, image, error) in
            
            completionHandler(request, response, image as? UIImage, error)
        })
    }
}
