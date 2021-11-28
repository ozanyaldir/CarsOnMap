# CarsOnMap

 CarsOnMap is an iOS application which shows the nearby cars in a region. It fetches the data from url ("https://cdn.sixt.io/codingtask/cars") and shows the results on a map or in a list. The details of a car (such as driver name, model, etc.) can be viewed into a detail page from the list page. There is no complex interactions with the app, only viewing the nearby cars feature is developed.

  
## Development

### Language
 - The project is developed in Swift programming language. And the UI development is made using SwiftUI. There is no UIKit used in the project.

### Architecture
 - The project is developed with MVVM design pattern. 

### Dependencies

 - Moya(v15.0), a networking library inherited from Alamofire. This library has a good structure to be integrated into any kind of project even if they are developed with RxSwift or Combine Framework.
 - ObjectMapper(v4.2) library to map fetched data into objects. ObjectMapper is a lightweight simple framework and in such simple applications it can be a useful alternative.
 - Kingfisher(v7.1) library to load images asynchronously from a url. Kingfisher is a well known reliable library which enables the developer to define caching policies or store temporarily or persistently images.
 - netfox(v1.19) is a useful network debugging library. Instead of logging or strugglin to visualize the network flow, using netfox which visualizes all networking without any efford is very useful for the integration of API calls.

## Tests

### Unit Tests
 - Some basic functionality tests yet.

### UI Tests
 - There is no UI Tests added yet.

## CI/CD

### Tool
 - Codemagic is used for test automation and deployment. (see `codemagic.yaml` file).

### Workflows

  - Testing Workflow; to run tests
  - Code signing workflow: to build and deploy application to appstoreconnect.


## Setup Requirements

### Git
 There is no multiple branches for the project. `main` branch can be used to compile the app.

### To install dependencies
 Only CocoaPods is used to add dependencies into the project. Run `pod install` will install all the dependencies.


## Screenshots
![alt text](./MAP.png?raw=true){:height="50%" width="50%"}
![alt text](./CAR_LIST.png?raw=true){:height="50%" width="50%"}
![alt text](./CAR_DETAIL.png?raw=true){:height="50%" width="50%"}
