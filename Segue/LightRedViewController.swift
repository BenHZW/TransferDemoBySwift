//
//  LightRedViewController.swift
//  Segue
//
//  Created by apple on 2019/7/13.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

protocol LightRedViewControllerDelegate
{
    func setColor(colorType:String)
}

class LightRedViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource
{

    var infoFromViewOne:String?
    var transferDelegate: LightRedViewControllerDelegate?
    var colorArray = ["red","blue","green"]
    
    @IBAction func backToView1(_ sender: UIButton)
    {
        //获取当前选的位置int
        let colorNumber = myPickerView.selectedRow(inComponent: 0)
        let color = colorArray[colorNumber]
        transferDelegate?.setColor(colorType: color)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myLabel.text = infoFromViewOne
        myPickerView.dataSource = self
        myPickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
