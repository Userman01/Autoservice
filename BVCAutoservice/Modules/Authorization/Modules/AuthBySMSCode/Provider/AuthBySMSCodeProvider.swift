//
//  Created by postnikov_pp on 30/11/2022.
//

protocol AuthBySMSCodeProviderProtocol {

}

struct AuthBySMSCodeProvider: AuthBySMSCodeProviderProtocol {
    let dataStore: AuthBySMSCodeDataStore
    let service: AuthBySMSCodeServiceProtocol

    init(dataStore: AuthBySMSCodeDataStore = AuthBySMSCodeDataStore(), service: AuthBySMSCodeServiceProtocol = AuthBySMSCodeService()) {
        self.dataStore = dataStore
        self.service = service
    }

}
