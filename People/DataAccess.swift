//
//  DataAccess.swift
//  People
//
//  Created by Mohammad Azam on 12/1/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

public class User : NSObject, NSCoding {
    
    var username :String!
    var password :String!
    var userId :String!
    
    init(username :String, password :String) {
        self.username = username
        self.password = password
    }

    public func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.userId,forKey: "userId")
        aCoder.encode(self.username, forKey: "username")
        aCoder.encode(self.password, forKey: "password")
    }

    public required init?(coder aDecoder: NSCoder) {
        
        self.userId = aDecoder.decodeObject(forKey: "userId") as! String
        self.username = aDecoder.decodeObject(forKey: "username") as! String
        self.password = aDecoder.decodeObject(forKey: "password") as! String
    }
    
}

public class DataAccess {
    
    func removeUsers() {
        
        // empty out test database
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "users")
    }
    
    private func alreadyExist(_ user :User) -> Bool {
        
        let users = getUsers()
        
        return users.contains { u in
            return u.username == user.username
        }
    }
    
    func saveUser(_ user:User) -> Bool  {
        
        if alreadyExist(user) {
            return false
        }
        
        var isSaved = false
        user.userId = UUID().uuidString
        
        var users = getUsers()
        users.append(user)
        
        let usersData = NSKeyedArchiver.archivedData(withRootObject: users)
        
        // save the user
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(usersData, forKey: "users")
        userDefaults.synchronize()
        isSaved = true
        
        return isSaved
    }
    
    func getUsers() -> [User] {
        
        let userDefaults = UserDefaults.standard
        let usersData = userDefaults.value(forKey: "users") as? Data
        if usersData == nil {
            return [User]()
        }
    
        let users = NSKeyedUnarchiver.unarchiveObject(with: usersData!) as! [User]
        return users
    }
 
}
