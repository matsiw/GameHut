//
//  GeneralUseProtocols.swift
//  GameHut
//
//  Created by Matthew A Siwkiewicz on 7/15/16.
//  Copyright © 2016 Matthew A Siwkiewicz. All rights reserved.
//

import Foundation

protocol ErrorHandling {
    func presentError(typeOfError: String, errorMessage: String)
}