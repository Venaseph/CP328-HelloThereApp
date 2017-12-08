//
//  ViewController.swift
//  HelloThereApp
//
//  Created by Chris Peragine on 12/6/17.
//  Copyright © 2017 UbiqutiousMedia. All rights reserved.
//

import UIKit

// Played with Delegate for keyboard handling and submit functionality
class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet private var outputTxtField: UILabel!
    @IBOutlet var inputTxtField: UITextField!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var segColorControl: UISegmentedControl!
    @IBOutlet var switchCaps: UISwitch!
    @IBOutlet var capsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Handle the text field's user input through delegate.
        inputTxtField.delegate = self
        
        //programmatically handle switch
        switchCaps.addTarget(self, action: #selector(switchChanged), for: UIControlEvents.valueChanged)

    }
    // had to expeose the func to obC for it to work, selectors in ObC are ref to methods where as in swift they rep the selector structure
    @objc func switchChanged(switchState: UISwitch) {
        if switchState.isOn {
            outputTxtField.text = outputTxtField.text?.uppercased()
        } else {
            outputTxtField.text = outputTxtField.text?.capitalized
        }
    }
    
    //Mark: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // set output to input
        outputTxtField.text = "Hello " + textField.text!
        switchChanged(switchState: switchCaps)
        //Return the placeholder value by setting input to nil
        inputTxtField.text = nil
    }
    
    //MARK: Actions
    @IBAction func Submit(_ sender: UIButton) {
        outputTxtField.text = " "
        outputTxtField.textColor = UIColor.purple
        segColorControl.selectedSegmentIndex = 0
        segColorControl.tintColor = UIColor.purple
        resetButton.backgroundColor = UIColor.purple
        switchCaps.onTintColor = UIColor.purple
        switchCaps.setOn(false, animated:true)
        capsLabel.textColor = UIColor.purple
    }

    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        //segindex settings to adjust colors on all outlet vars
        if(segColorControl.selectedSegmentIndex == 0) {
            outputTxtField.textColor = UIColor.purple
            segColorControl.tintColor = UIColor.purple
            resetButton.backgroundColor = UIColor.purple
            switchCaps.onTintColor = UIColor.purple
            capsLabel.textColor = UIColor.purple
        } else if (segColorControl.selectedSegmentIndex == 1) {
            outputTxtField.textColor = UIColor.blue
            segColorControl.tintColor = UIColor.blue
            resetButton.backgroundColor = UIColor.blue
            switchCaps.onTintColor = UIColor.blue
            capsLabel.textColor = UIColor.blue
        } else if(segColorControl.selectedSegmentIndex == 2) {
            outputTxtField.textColor = UIColor.brown
            segColorControl.tintColor = UIColor.brown
            resetButton.backgroundColor = UIColor.brown
            switchCaps.onTintColor = UIColor.brown
            capsLabel.textColor = UIColor.brown
        }
        
        /* control for seg color changer, more dry
        switch segColorControl.selectedSegmentIndex {
            case 0: outputTxtField.textColor = UIColor.red
            case 1: outputTxtField.textColor = UIColor.blue
            case 2: outputTxtField.textColor = UIColor.green
            default: break
        }
        */
    }
    
}

