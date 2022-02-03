//import Foundation
//import UIKit
//
//extension UIView{
//    func constraints(view: UIView, leftPosition: Bool,  topAnchorView: UIView, leadingAnchorView: UIView, trailingAnchorView: UIView) {
//    self.translatesAutoresizingMaskIntoConstraints = false
//        
//        if leftPosition == true {
//            
//            self.topAnchor.constraint(equalTo: topAnchorView.topAnchor, constant: 30).isActive = true
//            self.heightAnchor.constraint(equalToConstant: 27).isActive = true
//            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
//            self.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15).isActive = true
//        } else {
//            self.topAnchor.constraint(equalTo: topAnchorView.topAnchor, constant: 30).isActive = true
//            self.heightAnchor.constraint(equalToConstant: 27).isActive = true
//            self.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15).isActive = true
//            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
//        }
//    }
//}
//
//extension UIButton{
//    func setupsOfButton(view: UIView){
//        self.backgroundColor = .clear
//        self.setTitle("Change", for: .normal)
//        self.setTitleColor(UIColor.systemBlue, for: .normal)
//    }
//}
//
//extension UILabel{
//    func setupsOfLabel(view: UIView, text: String){
//        self.backgroundColor = .clear
//        self.textColor = .black
//        self.textAlignment = .center
//        self.text = text
//        self.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
//    }
//}
