//
//  ViewController.swift
//  MySwiftApp
//
//  Created by Nghia Nguyen on 11/5/20.
//

import UIKit
import TargetA
import RxSwift
import RxCocoa
import Alamofire

class ViewController: UIViewController {

    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        let loginManger = LoginManager.shared
        print(loginManger.startLogin())
        
        Observable<Int>.interval(.seconds(10), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] value in
                guard let self = self else {
                    return
                }
                print(value)
            })
            .disposed(by: bag)
        
        
        
        
    }


}

