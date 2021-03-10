//
//  RestClient.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 19/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import Foundation
import Alamofire
import PromiseKit
import Kingfisher

struct MultiPart{
    let data: Data
    let fileNameWithExt: String
    let serverKey: String
    let mimeType: MediaType
}
enum MediaType: String {
    case image = "image/png"
    case video = "video/mov"
}
 enum Resource {
    case signup
    case login
    case city
    
    case verificationOtpPhone
    case verificationOtpEmail
    case resendOtpPhone
    case socialLogin
    case resetPassword
    case resendEmail
    case changeUserPassword
    case deleteProfilePic
    case authorAll
    case categoryAll
    case bookAll
    case favouriteAll
    case searchBook
    case searchAuthor
    case bookListenAll
    case bookDownload(String)
    case updateDeviceToken(String)
    case updateNotificationStatus(String)
    case subscriptionCheckStatus(String)
    case downloadAll(String)
    case markFavouriteBook
    case authorProfile(String)
    case bookDetails(String)
    case authorBookDetails(String)
    case categoryBooks(String)
    case home
    case profileUpdate
    case getUser(String)
    case fetchProfileDetails
    case logout(String)
    case uploadProfilePic
    case featuredProducts
    case productCatalog
    case forgotPassword
    case getAllProducts
    case utilityBanner
    case getCategories
    case productSuggestion
    case productSearch
    case productCatalog_home
    case relatedProduct
    case cartAdd
    case cartView
    case cartRemove
    case notification
    case download
    case bookListen(String)
    case notificationAll(String)
    case listenbookDeleteAll
    case listenbookDelete(String)
    case addReview
    case subscriptionAddUpdate
    case updateEmailPhonenumber
    case emailVerification
    case mobileNumberVerification

    var resource: (method: HTTPMethod, endPoint: String) {
        switch self {
        case .signup:
            return (.post ,"signup")
        case .login:
            return (.post, "login")
        case .verificationOtpPhone:
            return (.post, "/auth/verifyMobileNumber")
        case .getUser(let id):
            return (.get, "/user/\(id)")
        case .fetchProfileDetails:
            return (.get, "/customer/profile")
        case .logout(let id):
            return (.get, "/auth/logout/\(id)")
        case .featuredProducts:
            return (.get, "/product/featured")
        case .productCatalog:
            return (.get, "/product/catalog")
        case .forgotPassword:
            return (.post, "profile/forget/password")
        case .getAllProducts:
            return (.post, "/authenticate/forgot_password")
        case .utilityBanner:
            return (.post, "/utility/banners")
        case .getCategories:
            return (.get, "/product/categories")
        case .productSuggestion:
            return (.get, "/product/suggestion")
        case .productSearch:
            return (.post, "/product/search")
        case .productCatalog_home:
            return (.get, "/product/catalog_home")
        case .relatedProduct:
            return (.get, "/product/related_products")
        case .cartAdd:
            return (.post, "/cart/add")
        case .cartView:
            return (.get, "/cart/view")
        case .cartRemove:
            return (.get, "/cart/remove")
        case .notification:
            return (.get, "/cart/remove")
        case .socialLogin:
            return (.post, "/auth/socialLogin")
        case .verificationOtpEmail:
            return (.post, "/auth/verifyEmail")
        case .resendOtpPhone:
            return (.post, "/auth/resendOTP")
        case .resetPassword:
            return (.post, "/auth/resetPassword")
        case .resendEmail:
            return (.post, "/auth/resendOTPEmail")
        case .changeUserPassword:
            return (.post, "/auth/changeUserPassword")
        case .profileUpdate:
            return (.post, "/auth/profileUpdate")
        case .uploadProfilePic:
            return (.post, "profile/update")
        case .deleteProfilePic:
            return (.post, "profile/remove/avatar")
        case .authorAll:
            return (.get, "/auth/author/all")
        case .categoryAll:
            return (.get, "/auth/category/all")
        case .home:
            return (.get, "/auth/home")
        case .bookAll:
            return (.get, "/auth/book/all")
        case .bookDetails(let id):
            return (.get, "/auth/book/details/\(id)")
        case .markFavouriteBook:
            return (.post, "/auth/markFavouriteBook")
        case .authorProfile(let id):
            return (.get, "/auth/author/Profile/\(id)")
        case .authorBookDetails(let id):
            return (.get, "/auth/author/bookDetails/\(id)")
        case .favouriteAll:
            return (.get, "/auth/favourite/all")
        case .searchBook:
            return (.post, "/auth/searchBook")
        case .searchAuthor:
            return (.post, "/auth/searchAuthor")
        case .categoryBooks(let id):
            return (.get, "/auth/category/books/\(id)")
        case .download:
            return (.get, "")
        case .bookListen(let id):
            return (.post, "/auth/book/listen/\(id)")
        case .bookListenAll:
            return (.get, "/auth/book/listen/all")
        case .listenbookDelete(let id):
            return (.delete, "/auth/listenbook/delete/\(id)")
        case .listenbookDeleteAll:
            return (.delete, "/auth/listenbook/deleteAll")
        case .addReview:
            return (.post, "/auth/add/review")
        case .bookDownload(let id):
        return (.post, "/auth/book/download/\(id)")
        case .downloadAll(let uuid):
            return (.get, "/auth/download/all/\(uuid)")
        case .subscriptionAddUpdate:
            return (.post, "/auth/subscription/addUpdate")
        case .updateDeviceToken(let id):
            return (.put, "/auth/updateDeviceToken/\(id)")
        case .updateNotificationStatus(let id):
            return (.put, "/auth/updateNotificationStatus/\(id)")
        case .subscriptionCheckStatus(let id):
            return (.get, "/auth/subscription/checkStatus/\(id)")
        case .updateEmailPhonenumber:
            return (.post, "/auth/updateEmailPhonenumber")
        case .notificationAll(let id):
            return (.get, "/auth/notification/all/\(id)")
        case .emailVerification:
            return (.post, "/auth/emailVerification")
        case .mobileNumberVerification:
            return (.post, "/auth/mobileNumberVerification")
        case .city:
            return (.get, "city")
        }
    }
}
class RestClient {
    var baseURL: String
    let session = AF
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    func requestWithParams<T: Decodable>(_ resource: Resource,
                                         parameters: [String: Any]?) -> Promise <T> {
        return Promise { seal in
            
            let method = resource.resource.method
            var url = "\(baseURL)\(resource.resource.endPoint)"
            if resource.resource.endPoint.contains("http"){
                url = resource.resource.endPoint
            }
            //if showLoader {
            //Loader.show()
            Console.log("LoaderShow")
            //}
            session.request(url,method: method, parameters: parameters, headers: HTTPHeaders(getHeaderData())).responseDecodable(of: T.self) { (response) in
                switch response.result{
                case .success(let data):
                    seal.fulfill(data)
                case .failure(let error):
                    seal.reject(self.actualError(error: error))
                }
                self.logRequest(response: response, param: parameters)
                self.logResponse(data: response.data)
            }
        }
    }
    
    func logResponse(data:Data?) {
        guard let dataValue = data else {
            return
        }
        if let json = try? JSONSerialization.jsonObject(with: dataValue, options: .allowFragments) as? [String:Any] {
            Console.log(RestClient.prettyPrintDict(with: json))
        }
        else {
            Console.log(String(data: dataValue, encoding: .utf8))
        }
    }
    
    func logRequest<T>(response: DataResponse<T, AFError>, param: [String: Any]?) {
        let url = response.request?.url
        let httpMethod = response.request?.httpMethod
        let code = response.response?.statusCode
        let header = response.response?.headers
        Console.log("URL:- \(url)")
        Console.log("HttpMethod:- \(httpMethod)")
        Console.log("Code:- \(code)")
        Console.log("Param:- \(param)")
        Console.log("header:- \(header)")
    }
    
     class func prettyPrintDict(with json: [String : Any]) -> String{
        do{
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let string = String(data: data, encoding: String.Encoding.utf8)
            if let string  = string{
                
                return string
            }
        }catch{
            Console.log(error.localizedDescription)
            
        }
        return ""
    }
    
    func upload<T: Decodable>(_ resource: Resource, onProgress: @escaping (Double)-> (),
                              parameters: [String: Any]?) -> Promise <T> {
        return Promise { seal in
            
            let method = resource.resource.method
            var url = "\(baseURL)\(resource.resource.endPoint)"
            if resource.resource.endPoint.contains("http"){
                url = resource.resource.endPoint
            }
            Console.log("LoaderShow")
            session.upload(multipartFormData: { multiPart in
                guard let params = parameters else{return}
                for (key, value) in params {
                    if let allMedia = value as? [MultiPart]{
                        let allkeys = allMedia.map({$0.serverKey})
                        let unique = Array(Set(allkeys))
                        for serverKey in unique{
                            let uploadFile = allMedia.filter({$0.serverKey == serverKey})
                            if uploadFile.count > 1 {
                                for media in uploadFile{
                                    multiPart.append(media.data, withName: "\(media.serverKey)[]", fileName: media.fileNameWithExt, mimeType: media.mimeType.rawValue)
                                }
                            }else{
                                if let media = uploadFile.first{
                                    multiPart.append(media.data, withName: media.serverKey, fileName: media.fileNameWithExt, mimeType: media.mimeType.rawValue)
                                }
                            }
                        }
                    }else if let media = value as? MultiPart{
                        multiPart.append(media.data, withName: media.serverKey, fileName: media.fileNameWithExt, mimeType: media.mimeType.rawValue)
                    }else if let data = "\(value)".data(using: .utf8) {
                        multiPart.append(data, withName: key)
                    }
                    
                }
            },to: url, method: method, headers: HTTPHeaders(getHeaderData()))
                .uploadProgress(queue: .main, closure: { progress in
                    onProgress(progress.fractionCompleted)
                })
                .responseDecodable(of: T.self) { (response) in
                    switch response.result{
                    case .success(let data):
                        seal.fulfill(data)
                    case .failure(let error):
                        seal.reject(self.actualError(error: error))
                    }
                    self.logRequest(response: response, param: parameters)
                    self.logResponse(data: response.data)
                    
            }
            
            
        }
    }
    
    func requestWithBody<T: Decodable>(_ resource: Resource,
                                       parameters: [String: Any]?) -> Promise <T> {
        return Promise { seal in
            
            let method = resource.resource.method
            var url = "\(baseURL)\(resource.resource.endPoint)"
            if resource.resource.endPoint.contains("http"){
                url = resource.resource.endPoint
            }
            //if showLoader {
            //Loader.show()
            Console.log("LoaderShow")
            
            //}
            session.upload(multipartFormData: { multiPart in
                guard let params = parameters else{return}
                for (key, value) in params {
                    if let data = "\(value)".data(using: .utf8) {
                        multiPart.append(data, withName: key)
                    }
                }
            },to: url, method: method, headers: HTTPHeaders(getHeaderData()))
                .uploadProgress(queue: .main, closure: { progress in
                    //onProgress(progress.fractionCompleted)
                })
                .responseDecodable(of: T.self) { (response) in
                    switch response.result{
                    case .success(let data):
                        seal.fulfill(data)
                    case .failure(let error):
                        seal.reject(self.actualError(error: error))
                    }
                    self.logResponse(data: response.data)
                    self.logRequest(response: response, param: parameters)
            }
        }
    }
    
    
    func getHeaderData() -> [String: String]{
        var headers = [String: String]()
        if let token = kUserDefaults.value(forKey: UserDefaultKeys.token) as? String {
            headers = [
                "Authorization": "Bearer \(token)"
            ]
        }
        headers["deviceType"] = "ios"
        headers["Accept"] = "application/json"
        return headers
    }
    func actualError(error: AFError) -> Error{
        if let underlyingError = error.underlyingError {
            if let urlError = underlyingError as? URLError {
                switch urlError.code {
                case .notConnectedToInternet:
                    return NSError(domain:"", code:urlError.code.rawValue, userInfo:[ NSLocalizedDescriptionKey: "The Internet connection appears to be offline."])
                case .networkConnectionLost:
                    return NSError(domain:"", code:urlError.code.rawValue, userInfo:[ NSLocalizedDescriptionKey: "The Internet connection appears to be offline."])
                default:
                    //Do something
                    return error
                }
            }
        }
        return error
    }
    
    
    class func checkIfFileExists(urlString: String) -> Bool{
        guard let url = URL(string: urlString) else {return false}
        let pathUrl = getDirectoryPath()
        if let fullPathUrl = pathUrl?.appendingPathComponent(url.lastPathComponent) {
            return FileManager.default.fileExists(atPath: fullPathUrl.path)
        }
        
        return false
        
    }
    class func getDirectoryPath()-> URL?{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    class func getDocumentDirectoryFilePath(string: String) -> URL?{
        let pathUrl = getDirectoryPath()
        return pathUrl?.appendingPathComponent(string)
    }
    class func saveFilesToDocumentDirectory(lastPath: String, data: Data) {
        let pathUrl = getDirectoryPath()
        if let fullPathUrl = pathUrl?.appendingPathComponent(lastPath) {
            do {
                // writes the image data to disk
                try data.write(to: fullPathUrl)
                print("file saved \(lastPath)")
            } catch {
                print("error saving file: \(error) path \(lastPath)")
            }
        }
    }
    class func removeFilesFromDocumentDirectory(lastPath: String){
        let pathUrl = getDirectoryPath()
        print("Path Url:- \(pathUrl)")
        if let fullPathUrl = pathUrl?.appendingPathComponent(lastPath) {
            let fileManager = FileManager.default
            do{
            try fileManager.removeItem(at: fullPathUrl)
                 print("file removed \(lastPath)")
            }catch{
                 print("error removing file: \(error) path \(lastPath)")
            }
        }
    }

    class func removeDocumentDirectory() {
        let fileManager = FileManager.default
        let myDocuments = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        do {
            try fileManager.removeItem(at: myDocuments)
        } catch {
            return
        }
    }
    
    class func getImageFromCacheOrDownload(url: URL) {
        let fullUrlSting = url.absoluteString
        guard let fullUrl = URL(string: fullUrlSting) else {
            DisplayBanner.show(message: "Invaliad url found, getSaveDownloadImage")
            return
        }
        KingfisherManager.shared.retrieveImage(with: fullUrl, options: nil, progressBlock: nil) {(image, error, cache, imageUrl) in
            if let error = error {
                Console.log(error)
                return
            }
            guard let image = image, let data = image.jpegData(compressionQuality: 1.0) else {return}
            saveFilesToDocumentDirectory(lastPath: url.lastPathComponent, data: data)
        }
    }
    
}

