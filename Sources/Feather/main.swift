//
//  main.swift
//  Feather
//
//  Created by Tibor Bodecs on 2019. 12. 17..
//

import FeatherCore

import SystemModule
import UserModule
import AdminModule
import ApiModule
import FrontendModule

import CommonModule

/// setup metadata delegate object
Feather.metadataDelegate = FrontendMetadataDelegate()

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let feather = try Feather(env: env)
defer { feather.stop() }

feather.useSQLiteDatabase()
feather.useLocalFileStorage()
feather.usePublicFileMiddleware()

try feather.configure([
    SystemBuilder(),
    UserBuilder(),
    AdminBuilder(),
    ApiBuilder(),
    FrontendBuilder(),

    CommonBuilder(),
])

if feather.app.isDebug {
    
}

try feather.start()
