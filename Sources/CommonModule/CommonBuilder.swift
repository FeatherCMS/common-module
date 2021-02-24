//
//  CommonBuilder.swift
//  CommonModule
//
//  Created by Tibor Bodecs on 2020. 08. 23..
//

import FeatherCore

@_cdecl("createCommonModule")
public func createCommonModule() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(CommonBuilder()).toOpaque()
}

public final class CommonBuilder: ViperBuilder {

    public override func build() -> ViperModule {
        CommonModule()
    }
}
