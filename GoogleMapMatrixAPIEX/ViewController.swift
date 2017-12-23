//
//  ViewController.swift
//  GoogleMapMatrixAPIEX
//
//  Created by PYC on 8/20/17.
//  Copyright © 2017 PYC. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController,UITextFieldDelegate {

    
    var originString: String?
    var destinationString:String?
    @IBOutlet weak var origin: UITextField!
    @IBOutlet weak var destination: UITextField!
    @IBOutlet var displayLabel: UIView!
    var destinations = [String?]()
    override func viewDidLoad() {
        super.viewDidLoad()
        origin.delegate = self
        destination.delegate = self
        print("testing")
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var displayLb: UILabel!
    @IBAction func addDestination(_ sender: UIButton) {
        
    }
    @IBAction func getMiles(_ sender: Any) {
        
        originString = origin.text
        destinationString =  destination.text
        let url: NSString = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=\(originString!)&destinations=\(destinationString!)&key=AIzaSyCTW7N5eDPF5Q_ZA6jouU0pqk_D7tk-b8I" as NSString
        let urlStr : NSString = url.addingPercentEscapes(using: String.Encoding.utf8.rawValue)! as NSString
       //let urlStr: NSString = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! as NSString
        if let searchURL = NSURL(string: urlStr as String){
            print(searchURL)
            if let data = try? Data(contentsOf: searchURL as URL){
                let json = JSON(data: data)
                
                print(json)
                for row in json["rows"].arrayValue{
                    for element in row["elements"].arrayValue{
                        print(element["distance"]["text"])
                        print(element["duration"]["text"])
                    }
                }
            }
        }
        
       
    }

    func parse(json: JSON) {
        for row in json["rows"].arrayValue {
            
         print(row)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if origin.isFirstResponder {
            origin.text = ""
        }
        if destination.isFirstResponder{
            destination.text = ""
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






























