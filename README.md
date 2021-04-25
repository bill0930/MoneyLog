# MoneyLog

This is a project to demonstrate a LoginView Using VIPER Architecture


setup:

1. git clone the project
2. cd to the project
3. pod install

## Dependencies 
Swift template

https://github.com/BinaryBirds/swift-template



## TEST ACCOUNT
test account: admin@email.com

password: 12345678


## Folder Hierachy
```
.
├── Gemfile
├── Gemfile.lock
├── IGLoginScreen.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   │   └── IDEWorkspaceChecks.plist
│   │   └── xcuserdata
│   │       └── billychan.xcuserdatad
│   │           └── UserInterfaceState.xcuserstate
│   ├── xcshareddata
│   │   └── xcschemes
│   │       └── IGLoginScreen.xcscheme
│   └── xcuserdata
│       └── billychan.xcuserdatad
│           └── xcschemes
│               ├── MoneyLog(Release).xcscheme
│               └── xcschememanagement.plist
├── MoneyLog
│   ├── AppDelegate.swift
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── Base.lproj
│   │   └── LaunchScreen.storyboard
│   ├── Commons
│   │   ├── Viper
│   │   │   ├── InteractorInterface.swift
│   │   │   ├── ModuleInterface.swift
│   │   │   ├── PresenterInterface.swift
│   │   │   ├── RouterInterface.swift
│   │   │   └── ViewInterface.swift
│   │   └── ViperLink
│   │       ├── InteractorPresenterInterface.swift
│   │       ├── LoginrPresenterInterface.swift
│   │       ├── PresenterInteractorInterface.swift
│   │       ├── PresenterRouterInterface.swift
│   │       ├── PresenterViewInterface.swift
│   │       └── ViewPresenterInterface.swift
│   ├── Config
│   │   └── GoogleService-Info.plist
│   ├── Containers
│   │   ├── Assembly
│   │   │   └── ServiceAssemby.swift
│   │   ├── HomeModuleAssembly.swift
│   │   └── MainAssembler.swift
│   ├── Extensions
│   │   ├── UIColor+Extension.swift
│   │   └── UIViewController+extension.swift
│   ├── Info.plist
│   ├── Managers
│   │   └── UserManager.swift
│   ├── Modules
│   │   ├── Home
│   │   │   ├── HomeInteractor.swift
│   │   │   ├── HomeModule.swift
│   │   │   ├── HomeModuleAssembly.swift
│   │   │   ├── HomePresenter.swift
│   │   │   ├── HomeRouter.swift
│   │   │   └── HomeView.swift
│   │   └── Login
│   │       ├── LoginInteractor.swift
│   │       ├── LoginModule.swift
│   │       ├── LoginModuleAssembly.swift
│   │       ├── LoginPresenter.swift
│   │       ├── LoginRouter.swift
│   │       └── LoginView.swift
│   ├── SceneDelegate.swift
│   └── Services
│       └── LoginService
│           ├── LoginService.swift
│           └── Model
│               └── User.swift
├── MoneyLog.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   └── xcshareddata
│   │       └── IDEWorkspaceChecks.plist
│   └── xcshareddata
│       └── xcschemes
│           └── MoneyLog.xcscheme
├── MoneyLog.xcworkspace
│   ├── contents.xcworkspacedata
│   ├── xcshareddata
│   │   └── IDEWorkspaceChecks.plist
│   └── xcuserdata
│       └── billychan.xcuserdatad
│           ├── UserInterfaceState.xcuserstate
│           └── xcdebugger
│               └── Breakpoints_v2.xcbkptlist
├── Podfile
├── Podfile.lock
└── README.md
```

https://user-images.githubusercontent.com/43231465/115996793-58d6e580-a613-11eb-92ab-6ad0cc415045.mp4

