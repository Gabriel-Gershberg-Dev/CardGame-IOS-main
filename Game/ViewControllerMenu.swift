import UIKit
import CoreLocation


class ViewControllerMenu: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var westDir: UIImageView!
    @IBOutlet weak var eastDir: UIImageView!
    @IBOutlet weak var setNameBtu: UIButton!
    @IBOutlet weak var welcomeText: UITextView!
    var name=""
    override func viewDidLoad() {

        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()

        if let savedName = UserDefaults.standard.string(forKey: "userName") {
            welcomeText.text = "Welcome, \(savedName)!"
            nameTextField.isHidden = true
            setNameBtu.isHidden = true
        
        }
    }
    @IBAction func setName(_ sender: Any) {
        UserDefaults.standard.set(nameTextField.text, forKey: "userName")
        nameTextField.isHidden = true
        setNameBtu.isHidden = true
        name = nameTextField.text ?? "nil"
        welcomeText.text = "Welcome, \(name)!"

        
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            if latitude > 34.817549168324334{
                eastDir.isHidden = true
                UserDefaults.standard.set("West", forKey: "LocationSide")

                
            }
            else{
                westDir.isHidden = true
                UserDefaults.standard.set("East", forKey: "LocationSide")
                
                
            }
            // You can use the latitude and longitude here as needed
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }

    
    


    private func hideNameInputFields() {
        nameTextField.isHidden = true
    }
}
