/* Copyright (c) 2023 BlackBerry Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var toolbar: UIToolbar!
    
    // View-Models
    var viewModel: GreetingsViewModel!
    var dataViewModel: AppKineticsViewModel!
    var troubleshootingViewModel: TroubleshootingViewModel!
        
    // For iPad toolbar and troubleshooting button will be hidden in Root View Controller and displayed on About View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.accessibilityIdentifier = UIAccessibilityIdentifiers.SSSMainUIID
        viewModel = GreetingsViewModel(delegate: self)
        dataViewModel = AppKineticsViewModel(delegate: self)
        userInterfaceIdiom(
            iPhone: { () -> Void in
                ServicesServerGDiOSDelegate.sharedInstance.rootViewController = self
            },
            iPad: {() -> Void in
                self.toolbar.isHidden = true
            }
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userInterfaceIdiom(
            iPhone: { () -> Void in
                self.troubleshootingViewModel = TroubleshootingViewModel(delegate: self)
            },
            iPad: {() -> Void in
                
            }
        )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        userInterfaceIdiom(
            iPhone: { () -> Void in
                self.troubleshootingViewModel = nil
            },
            iPad: {() -> Void in
                
            }
        )
    }
    
    // MARK: - IBActions
    
    @IBAction func bringToFrontServiceButtonOnTouchUpInside(_ sender: UIButton) {
        viewModel.tryBringToFrontService()

    }
    
    @IBAction func showTroubleshootingOptions(_ sender: UIBarButtonItem) {
        troubleshootingViewModel.troubleshoot(sender)
    }
    
    @IBAction func showAbout(_ sender: Any) {
        AboutWindow.show()
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == Constants.appKineticsSegueIdentifier {
            
            let viewController = segue.destination as! AppKineticsViewController
            viewController.viewModel = dataViewModel
        }
    }
}


