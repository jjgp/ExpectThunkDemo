//
//  ViewController.swift
//  ExpectThunkDemo
//
//  Created by Jason Prasad on 2/19/19.
//  Copyright © 2019 jjgp. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftThunk

struct FakeState: StateType {}
struct FakeAction: Action, Equatable {}
struct AnotherFakeAction: Action, Equatable {}

let thunk = Thunk<FakeState> { dispatch, getState in
    if let _ = getState() {
        dispatch(FakeAction())
    }
    DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 0.5) {
        if getState() == nil {
            dispatch(AnotherFakeAction())
        }
    }
    
    if let _ = getState() {
        dispatch(FakeAction())
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

