//
//  Sickbeard.swift
//  iSickbeard
//
//  Created by Carlos Santos on 01/02/15.
//  Copyright (c) 2015 Carlos Santos. All rights reserved.
//

import Alamofire

struct Sickbeard {
    
    enum Router: URLRequestConvertible {
        
        static var currentServer: Server?
        
        // MARK: Possible Routes
        
        case Ping()
        case ShowList()
        case ShowSeasons(Int)
        case ShowPoster(Int)
        
        
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
