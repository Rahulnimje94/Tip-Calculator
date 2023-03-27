//
//  tip_CalculatorSnapShotTests.swift
//  tip-calculatorTests
//
//  Created by Rahul Nimje on 27/03/23.
//

import XCTest
import SnapshotTesting

@testable import tip_calculator

final class tip_CalculatorSnapShotTests: XCTestCase {
    
    private var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func testLogoView() {
        // given
        let size = CGSize(width: screenWidth, height: 48)
        // when
        let view = LogoView()
        // then
        
        // Remove ", record: true " after installing into the device and use that perticular decive otherwise snapshot test will fail so you need to record again
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialResultView() {
        // given
        let size = CGSize(width: screenWidth, height: 224)
        // when
        let view = ResultView()
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testResultViewWithValues() {
        // given
        let size = CGSize(width: screenWidth, height: 224)
        let result = Result(amountPerPerson: 100.25, totalBill: 45, totalTip: 60)
        // when
        let view = ResultView()
        view.configure(result: result)
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testBillInputValues() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = BillInputView()
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testBillInputViewWithValues() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = BillInputView()
        let textField = view.allSubviewsOf(type: UITextField.self).first
        textField?.text = "500"
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialTipInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56+56+16)
        // when
        let view = TipInputView()
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testTipInputViewWithSelection() {
        // given
        let size = CGSize(width: screenWidth, height: 56+56+16)
        // when
        let view = TipInputView()
        let button = view.allSubviewsOf(type: UIButton.self).first
        button?.sendActions(for: .touchUpInside)
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testInitialSplitInputView() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = SplitInputView()
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    func testSplitInputViewWithSelection() {
        // given
        let size = CGSize(width: screenWidth, height: 56)
        // when
        let view = SplitInputView()
        let button = view.allSubviewsOf(type: UIButton.self).last
        button?.sendActions(for: .touchUpInside)
        // then
        assertSnapshot(matching: view, as: .image(size: size))
    }
    
    
}

extension UIView {
    
    func allSubviewsOf<T: UIView>(type: T.Type) -> [T] {
        var all = [T]()
        func getSubViews(view: UIView) {
            if let aView = view as? T {
                all.append(aView)
            }
            
            guard view.subviews.count > 0 else { return }
            
            view.subviews.forEach{ getSubViews(view: $0) }
        }
        
        getSubViews(view: self)
        return all
    }
    
}
