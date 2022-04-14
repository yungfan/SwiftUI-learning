//
//  Store.swift
//  SwiftUI2Learning
//
//  Created by 杨帆 on 2021/4/10.
//

import StoreKit

typealias FetchCompletionHandler = (([SKProduct]) -> Void)
typealias PurchaseCompletionHandler = ((SKPaymentTransaction?) -> Void)

class Store: NSObject, ObservableObject {
    @Published var allProducts = [Product]()

    private let allProductIdentifiers = Set(["com.yf.iap.pro"])
    private var completedPurchases = [String]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                for index in self.allProducts.indices {
                    self.allProducts[index].isLocked = !self.completedPurchases.contains(self.allProducts[index].id)
                }
            }
        }
    }

    private var productsRequest: SKProductsRequest?
    private var fetchedProducts = [SKProduct]()
    private var fetchCompletionHandler: FetchCompletionHandler?
    private var purchaseCompletionHandler: PurchaseCompletionHandler?
    var purchased: Bool {
        !completedPurchases.isEmpty
    }

    override init() {
        super.init()
        startObservingPaymentQueue()
        fetchProducts { products in
            self.allProducts = products.map {
                Product(product: $0)
            }
            print("products + \(products)")
        }
    }

    func loadStoredPurchases() {
        if let storedPurchases = UserDefaults.standard.object(forKey: "completedPurchases") as? [String] {
            completedPurchases = storedPurchases
        }
    }

    private func startObservingPaymentQueue() {
        SKPaymentQueue.default().add(self)
    }

    private func fetchProducts(_ completion: @escaping FetchCompletionHandler) {
        guard productsRequest == nil else { return }
        fetchCompletionHandler = completion
        productsRequest = SKProductsRequest(productIdentifiers: allProductIdentifiers)
        productsRequest?.delegate = self
        productsRequest?.start()
    }

    private func buy(_ product: SKProduct, completion: @escaping PurchaseCompletionHandler) {
        purchaseCompletionHandler = completion
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
}

extension Store {
    func product(for identifier: String) -> SKProduct? {
        return fetchedProducts.first(where: { $0.productIdentifier == identifier })
    }

    func purchaseProduct(_ product: SKProduct) {
        startObservingPaymentQueue()
        buy(product) { _ in }
    }

    func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
        if !completedPurchases.isEmpty {
            UserDefaults.standard.setValue(completedPurchases, forKey: "completedPurchases")
        }
    }
}

extension Store: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            var shouldFinishTransaction = false
            switch transaction.transactionState {
            case .purchased, .restored:
                completedPurchases.append(transaction.payment.productIdentifier)
                shouldFinishTransaction = true
            case .failed:
                shouldFinishTransaction = true
            case .deferred, .purchasing:
                break
            @unknown default:
                break
            }

            if shouldFinishTransaction {
                SKPaymentQueue.default().finishTransaction(transaction)
                DispatchQueue.main.async {
                    self.purchaseCompletionHandler?(transaction)
                    self.purchaseCompletionHandler = nil
                }
            }

            if !completedPurchases.isEmpty {
                UserDefaults.standard.setValue(completedPurchases, forKey: "completedPurchases")
            }
        }
    }
}

extension Store: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let loadedProducts = response.products
        let invalidProducts = response.invalidProductIdentifiers

        guard !loadedProducts.isEmpty else {
            print("Could not load.")
            if !invalidProducts.isEmpty {
                print("Invalid products are: \(invalidProducts)")
            }
            productsRequest = nil
            return
        }

        fetchedProducts = loadedProducts
        DispatchQueue.main.async {
            self.fetchCompletionHandler?(loadedProducts)
            self.fetchCompletionHandler = nil
            self.productsRequest = nil
        }
    }
}

struct Product: Hashable {
    let id: String
    let title: String
    let description: String
    var isLocked: Bool
    var price: String?
    let locale: Locale
    let imageName: String

    lazy var formatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.locale = locale
        return nf
    }()

    init(product: SKProduct, islocked: Bool = true) {
        id = product.productIdentifier
        title = product.localizedTitle
        description = product.localizedDescription
        isLocked = islocked
        locale = product.priceLocale
        imageName = product.productIdentifier

        if islocked {
            price = formatter.string(from: product.price)
        }
    }
}
