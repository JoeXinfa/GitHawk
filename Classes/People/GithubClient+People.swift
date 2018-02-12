//
//  GithubClient+People.swift
//  Freetime
//
//  Created by Ryan Nystrom on 11/19/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import Foundation

extension GithubClient {

    func fetchAssignees(
        owner: String,
        repo: String,
        page: Int,
        completion: @escaping (Result<([User], Int?)>) -> Void
        ) {
        // https://developer.github.com/v3/issues/assignees/#list-assignees
        request(GithubClient.Request(
            path: "repos/\(owner)/\(repo)/assignees",
            parameters: [
                "per_page": 50,
                "page": page
            ]
        ) { (response, nextPage) in
            if let jsonArr = response.value as? [[String: Any]] {
                var users = [User]()
                for json in jsonArr {
                    if let user = User(json: json) {
                        users.append(user)
                    }
                }
                users.sort { $0.login.caseInsensitiveCompare($1.login) == .orderedAscending }
                completion(.success((users, nextPage?.next)))
            } else {
                completion(.error(response.error))
            }
        })
    }

}
