import Foundation
import UIKit

extension UIView{
    func constraints(views: UIView){
    self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: views.topAnchor, constant: 0).isActive = true
    self.leadingAnchor.constraint(equalTo: views.leadingAnchor, constant: 0).isActive = true
    self.trailingAnchor.constraint(equalTo: views.trailingAnchor, constant: 0).isActive = true
    self.bottomAnchor.constraint(equalTo: stackViews.topAnchor, constant: 0).isActive = true
    }
    
    
    func constrainsStackView(views: UIView, stackViews : UIStackView,indent:Int, stackAndView:UIView,active:Bool){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: stackViews.bottomAnchor, constant: CGFloat(indent)).isActive = true
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.leadingAnchor.constraint(equalTo: views.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: views.trailingAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: views.bottomAnchor, constant:-40).isActive = active
    }
 
   
    
}

extension UIButton{
    func parametr(color:UIColor,sign: String){
        self.backgroundColor = color
        self.layer.cornerRadius = 50
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        self.setTitle(sign, for: .normal)
        self.layer.borderWidth = 0.5
        self.layer.borderColor =  UIColor.white.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 10
        self.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    func con(size:Int){
   self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true
    }
    func radius(){
        
    }
}


extension UIStackView{
    func parStack(views:UIView){
    self.axis = .horizontal
    self.distribution = .fillEqually
    self.spacing = 10
    self.backgroundColor = .black
        views.addSubview(self)
    }
}

