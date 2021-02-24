//
//  CommonModule.swift
//  CommonModule
//
//  Created by Tibor Bodecs on 2020. 03. 28..
//

import FeatherCore

final class CommonModule: ViperModule {

    static let name = "common"
    var priority: Int { 3000 }

    static var bundleUrl: URL? {
        Bundle.module.resourceURL?.appendingPathComponent("Bundle")
    }

    func boot(_ app: Application) throws {
        app.hooks.register("css", use: cssHook)
    }

    func cssHook(args: HookArguments) -> [[String: Any]] {
        [
            [
                "name": "vars",
                "priority": 900,
            ],
            [
                "name": "reset",
                "priority": 800,
            ],
            [
                "name": "nav",
                "priority": 700,
            ],
        ]
    }
}
