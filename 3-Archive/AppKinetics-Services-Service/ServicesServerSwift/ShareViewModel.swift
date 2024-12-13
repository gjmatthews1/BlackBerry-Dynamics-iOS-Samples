/* Copyright (c) 2023 BlackBerry Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import Foundation
import BlackBerryDynamics

open class ShareViewModel {
    
    open weak var delegate: ServiceTransferDelegate?
    
    open var serviceProviders: Array<GDServiceProvider> = {
        return Service.serviceProviders
    }()
    
    init(delegate: ServiceTransferDelegate) {
        print(#file, #function)
        self.delegate = delegate
    }
    
    deinit {
        print(#file, #function)
    }
    
    open func appSelected(_ application: GDServiceProvider) {
        // Delegate file transfer to Preview View-Model
        self.delegate?.tryFileTransferToApplication(application.address!, withVersion: application.version, andName: application.name)
    }
}