# CarsOnMap

  CarsOnMap is an iOS application which shows the nearby cars in a region. It fetches the data from url ("https://cdn.sixt.io/codingtask/cars") and shows the results on a map or in a list.

  
 ## Development

  ### Language
    - The project is developed with Swift language using SwiftUI for UI development. Swift is the language I've been developing from the first years of my career, I am mostly comfortable with Swift language. I like to use new technologies, I developed the UI using SwiftUI.

  ### Architecture
    - The project is developed with MVVM design pattern. I usually prefer MVVM while starting a new project, used to develop applications using MVC too.


 ## Dependencies

 - Moya(v15.0), a networking library inherited from Alamofire. This library has a good structure to be integrated into any kind of project even if they are developed with RxSwift or Combine Framework.
 - ObjectMapper(v4.2) library to map fetched data into objects. ObjectMapper is a lightweight simple framework and in such simple applications it can be a useful alternative.
 - Kingfisher(v7.1) library to load images asynchronously from a url. Kingfisher is a well known reliable library which enables the developer to define caching policies or store temporarily or persistently images.
 - netfox(v1.19) is a useful network debugging library. Instead of logging or strugglin to visualize the network flow, using netfox which visualizes all networking without any efford is very useful for the integration of API calls.

 ### To install dependencies
  Only CocoaPods is used to add dependencies into the project. Run `pod install` will install all the dependencies.