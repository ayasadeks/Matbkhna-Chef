

import Foundation
import UIKit
import MOLH

extension UIViewController {
    
    func showAlert(title : String, messages : [String]?, message: String?, selfDismissing: Bool) {
        
        var messageContent = ""
        
        if let messages = messages {
            for message in messages {
                messageContent += message + "\n"
            }
        }
        
        if let message = message {
            messageContent = message
        }
        
        let alert = UIAlertController(title: title, message: messageContent, preferredStyle: .alert)
        
        
        if !selfDismissing {
            let title = NSLocalizedString("OK", comment: "Any")
            alert.addAction(UIAlertAction(title: title, style: .cancel, handler: nil))
        }
        
        present(alert, animated: true)
        
        if selfDismissing {
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) { [weak self] in
                alert.dismiss(animated: true)
            } }
    }
    
    var isInteractionEnabled: Bool {
        get {
            return true
        }
        set {
            if !isInteractionEnabled {
                UIApplication.shared.beginIgnoringInteractionEvents()
            } else {
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
    }
    
    func interactionEnable(with indicator: UIActivityIndicatorView) {
        if indicator.isHidden {
            indicator.isHidden = false
            indicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
        } else {
            indicator.isHidden = true
            indicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    func getCurrentDeviceLanguage() -> String {
        let lang = MOLHLanguage.currentAppleLanguage()
        return lang
    }
}
