//
//  Network.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 19/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import PromiseKit
var service: ApiInterface?

protocol ApiInterface {
    func uploadProfilePic<T: Decodable>(onProgress: @escaping (Double)-> (), parameters:[ String: Any]) -> Promise<T>
    func signup<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func login<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    
    
    func cityList<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func verificationOtpEmail<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func emailVerification<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func mobileNumberVerification<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func resendOtpPhone<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func resendEmail<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func socialLogin<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func forgotPassword<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func updateEmailPhonenumber<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func resetPassword<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func changeUserPassword<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func profileUpdate<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func deleteProfilePic<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func authorAll<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func categoryAll<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func bookAll<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func favouriteAll<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func bookDetails<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func notificationAll<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func home<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func markFavouriteBook<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func updateDeviceToken<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func subscriptionCheckStatus<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func updateNotificationStatus<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func authorProfile<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func authorBookDetails<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func categoryBooks<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func searchBook<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func searchAuthor<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func bookListenAll<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func listenbookDeleteAll<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func logoutUser<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func fetchProfile<T: Decodable>(parameters:[ String: Any]) -> Promise<T>
    func getAllProducts<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func bookListen<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func bookDownload<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func listenbookDelete<T: Decodable>(id: String, parameters:[ String: Any]?) -> Promise<T>
    func addReview<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func subscriptionAddUpdate<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func getHomeBannerData<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func getAllCategories<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func productSuggestion<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func productSearch<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func productCatalogHome<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func downloadAll<T: Decodable>(uuid: String, parameters:[ String: Any]?) -> Promise<T>
    func relatedProduct<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    
    func cartAdd<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    func cartView<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>

    func cartRemove<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
    
    func notification<T: Decodable>(parameters:[ String: Any]?) -> Promise<T>
  
}

final class Network: ApiInterface {
    func cityList<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.city, parameters: parameters)
    }
    
    func mobileNumberVerification<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.mobileNumberVerification, parameters: parameters)
    }
    
    func emailVerification<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.emailVerification, parameters: parameters)
    }
    
    func notificationAll<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.notificationAll(id), parameters: parameters)
    }
    
    func updateEmailPhonenumber<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.updateEmailPhonenumber, parameters: parameters)
    }
    
    func logoutUser<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.logout(id), parameters: parameters)
    }
    
    func subscriptionCheckStatus<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.subscriptionCheckStatus(id), parameters: parameters)
    }
    
    func updateNotificationStatus<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.updateNotificationStatus(id), parameters: parameters)
    }
    
    func updateDeviceToken<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.updateDeviceToken(id), parameters: parameters)
    }
    
    func subscriptionAddUpdate<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.subscriptionAddUpdate, parameters: parameters)
    }
    
   
    func downloadAll<T>(uuid: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.downloadAll(uuid), parameters: parameters)
    }
    
    func bookDownload<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.bookDownload(id), parameters: parameters)
    }
    
    func addReview<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.addReview, parameters: parameters)
    }
    
    func listenbookDelete<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.listenbookDelete(id), parameters: parameters)
    }
    
    func bookListenAll<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.bookListenAll, parameters: parameters)
    }
    
    func bookListen<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.bookListen(id), parameters: parameters)
    }
    func listenbookDeleteAll<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.listenbookDeleteAll, parameters: parameters)
    }
  
   
    func categoryBooks<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
         client.requestWithParams(.categoryBooks(id), parameters: parameters)
    }
    func searchAuthor<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.searchAuthor, parameters: parameters)
    }
    
    func searchBook<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.searchBook, parameters: parameters)
    }
    
    func favouriteAll<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.favouriteAll, parameters: parameters)
    }
    
    func authorBookDetails<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
         client.requestWithParams(.authorBookDetails(id), parameters: parameters)
    }
    
    func authorProfile<T>(id: String, parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.authorProfile(id), parameters: parameters)
    }
    
    func markFavouriteBook<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.markFavouriteBook, parameters: parameters)
    }
    
    func bookDetails<T>(id : String ,parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.bookDetails(id), parameters: parameters)
    }
    func bookAll<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.bookAll, parameters: parameters)
    }
    
    func home<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.home, parameters: parameters)
    }
    
    func categoryAll<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.categoryAll, parameters: parameters)
    }
    
    func authorAll<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.authorAll, parameters: parameters)
    }
    
    func deleteProfilePic<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.deleteProfilePic, parameters: parameters)
    }
    
    func profileUpdate<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.profileUpdate, parameters: parameters)
    }
    
    func changeUserPassword<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.changeUserPassword, parameters: parameters)
    }
    
    func resendEmail<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.resendEmail, parameters: parameters)
    }
    
    func resetPassword<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.resetPassword, parameters: parameters)
    }
    
    func resendOtpPhone<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
         return client.requestWithParams(.resendOtpPhone, parameters: parameters)
    }
    func forgotPassword<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
         return client.requestWithParams(.forgotPassword, parameters: parameters)
    }
    func verificationOtpEmail<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.verificationOtpEmail, parameters: parameters)
    }
    
    func socialLogin<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.socialLogin, parameters: parameters)
    }
    
    func signup<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.signup, parameters: parameters)
    }
    func login<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.login, parameters: parameters)
    }
    func verificationOtpPhone<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.verificationOtpPhone, parameters: parameters)
    }
    
    func notification<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.notification, parameters: parameters)
    }
    
    func cartRemove<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.cartRemove, parameters: parameters)
    }
    
    func cartView<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
         client.requestWithParams(.cartView, parameters: parameters)
    }
    
    func cartAdd<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithBody(.cartAdd, parameters: parameters)
    }
    
    func relatedProduct<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.relatedProduct, parameters: parameters)
    }
    
    func productCatalogHome<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.productCatalog_home, parameters: parameters)
    }
    
    func productSearch<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.productSearch, parameters: parameters)
    }
    
    func productSuggestion<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.productSuggestion, parameters: parameters)
    }
    
    func getAllCategories<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        client.requestWithParams(.getCategories, parameters: parameters)
    }
    func getHomeBannerData<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.utilityBanner, parameters: parameters)
    }
    
    func getAllProducts<T>(parameters: [String : Any]?) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.getAllProducts, parameters: parameters)
    }
    

    
    func uploadProfilePic<T>(onProgress: @escaping (Double) -> (), parameters: [String : Any]) -> Promise<T> where T : Decodable {
        return client.upload(.uploadProfilePic, onProgress: onProgress, parameters: parameters)
    }
    
    func fetchProfile<T>(parameters: [String : Any]) -> Promise<T> where T : Decodable {
        return client.requestWithParams(.fetchProfileDetails, parameters: parameters)
    }
    
   
    
    private let client = RestClient(baseURL: "http://3.136.243.61/api/")
    
    init() {
       
    }
    
 
}
