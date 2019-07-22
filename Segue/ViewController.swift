//
//  ViewController.swift
//  Segue
//
//  Created by apple on 2019/7/12.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,LightRedViewControllerDelegate
{
    func setColor(colorType: String)
    {
        if colorType == "red"
        {
            view.backgroundColor = .red
        }
        else if colorType == "green"
        {
            view.backgroundColor = .green
        }
        else if colorType == "blue"
        {
            view.backgroundColor = .blue
        }
    }
    

    
    @IBOutlet weak var myTextField: UITextField!

    @IBAction func changeView(_ sender: UIButton)
    {
        if let inputText = myTextField.text
        {
            if inputText == ""
            {
                //没有输入内容跳出警告控制器
               let myAlert = UIAlertController(title: "No input", message: "Please enter something", preferredStyle: .alert)
               let OkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                myAlert.addAction(OkAction)
                present(myAlert, animated: true, completion: nil)
            }
            else
            {
                //跳转
                performSegue(withIdentifier: "goToView2", sender: inputText)
                //跳转后清空输入框内容
                myTextField.text = ""
                //收键盘
                myTextField.resignFirstResponder()
            }
        }
    }
    
    //从stroyboard找线
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //找到指定的线
        if segue.identifier == "goToView2"
        {
            //找到目的地
           if let lightRed = segue.destination as? LightRedViewController
           {
            //设定属性
            //lightRed.infoFromViewOne = myTextField.text
            lightRed.infoFromViewOne = sender as?String
            lightRed.transferDelegate = self
            }
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

