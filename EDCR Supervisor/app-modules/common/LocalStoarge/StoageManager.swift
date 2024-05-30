//
//  StoageManager.swift
//  EDCR Supervisor
//
//  Created by Md Altaf Hoshain Firoj on 29/5/24.
//

import Foundation

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    private let mRealm:Realm
    
    private init() {
        mRealm = try! Realm()
    }
    
    func saveObject<T: Object>(_ object:T){
        do {
            try mRealm.write {
                mRealm.add(object)
            }
        } catch {
            print("Error saving obejcts \(error.localizedDescription)")
        }
    }
    
    func getObject<T: Object>(_ type:T.Type, primaryKey: Any) -> T? {
        return mRealm.object(ofType: type, forPrimaryKey: primaryKey)
    }
    
    func getAllObjects<T: Object>(_ type: T.Type) -> Results<T> {
           return mRealm.objects(type)
       }
    
    func deleteUserModel() {
        do {
            try mRealm.write {
                let userModels = mRealm.objects(UserModel.self)
                mRealm.delete(userModels)
            }
        } catch {
            print("Error deleting user model: \(error.localizedDescription)")
        }
    }
    
}
