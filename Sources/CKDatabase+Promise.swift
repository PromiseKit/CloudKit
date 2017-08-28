import CloudKit.CKDatabase
#if !PMKCocoaPods
import PromiseKit
#endif

/**
 To import the `CKDatabase` category:

    use_frameworks!
    pod "PromiseKit/CloudKit"
 
 And then in your sources:

    @import PromiseKit;
*/
extension CKDatabase {
    /// Fetches one record asynchronously from the current database.
    public func fetch(withRecordID recordID: CKRecordID) -> Promise<CKRecord> {
        return Promise(.pending) { fetch(withRecordID: recordID, completionHandler: $0.resolve) }
    }

    /// Fetches one record zone asynchronously from the current database.
    public func fetch(withRecordZoneID recordZoneID: CKRecordZoneID) -> Promise<CKRecordZone> {
        return Promise(.pending) { fetch(withRecordZoneID: recordZoneID, completionHandler: $0.resolve) }
    }
    /// Fetches all record zones asynchronously from the current database.
    public func fetchAllRecordZones() -> Promise<[CKRecordZone]> {
        return Promise(.pending) { fetchAllRecordZones(completionHandler: $0.resolve) }
    }

    /// Saves one record zone asynchronously to the current database.
    public func save(_ record: CKRecord) -> Promise<CKRecord> {
        return Promise(.pending) { save(record, completionHandler: $0.resolve) }
    }

    /// Saves one record zone asynchronously to the current database.
    public func save(_ recordZone: CKRecordZone) -> Promise<CKRecordZone> {
        return Promise(.pending) { save(recordZone, completionHandler: $0.resolve) }
    }

    /// Delete one subscription object asynchronously from the current database.
    public func delete(withRecordID recordID: CKRecordID) -> Promise<CKRecordID> {
        return Promise(.pending) { delete(withRecordID: recordID, completionHandler: $0.resolve) }
    }

    /// Delete one subscription object asynchronously from the current database.
    public func delete(withRecordZoneID zoneID: CKRecordZoneID) -> Promise<CKRecordZoneID> {
        return Promise(.pending) { delete(withRecordZoneID: zoneID, completionHandler: $0.resolve) }
    }

    /// Searches the specified zone asynchronously for records that match the query parameters.
    public func perform(_ query: CKQuery, inZoneWith zoneID: CKRecordZoneID? = nil) -> Promise<[CKRecord]> {
        return Promise(.pending) { perform(query, inZoneWith: zoneID, completionHandler: $0.resolve) }
    }

    /// Fetches the record for the current user.
    public func fetchUserRecord(_ container: CKContainer = CKContainer.default()) -> Promise<CKRecord> {
        return container.fetchUserRecordID().then(on: nil) { uid in
            return self.fetch(withRecordID: uid)
        }
    }

#if !os(watchOS)
    /// Fetches one record zone asynchronously from the current database.
    public func fetch(withSubscriptionID subscriptionID: String) -> Promise<CKSubscription> {
        return Promise(.pending) { fetch(withSubscriptionID: subscriptionID, completionHandler: $0.resolve) }
    }

    /// Fetches all subscription objects asynchronously from the current database.
    public func fetchAllSubscriptions() -> Promise<[CKSubscription]> {
        return Promise(.pending) { fetchAllSubscriptions(completionHandler: $0.resolve) }
    }

    /// Saves one subscription object asynchronously to the current database.
    public func save(_ subscription: CKSubscription) -> Promise<CKSubscription> {
        return Promise(.pending) { save(subscription, completionHandler: $0.resolve) }
    }

    /// Delete one subscription object asynchronously from the current database.
    public func delete(withSubscriptionID subscriptionID: String) -> Promise<String> {
        return Promise(.pending) { delete(withSubscriptionID: subscriptionID, completionHandler: $0.resolve) }
    }
#endif
}
