//
//  ViewController.swift
//  IHO-ASU
//
//  Created by Sweta Singhal on 2/7/17.
//  Copyright © 2017 Sweta Singhal. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var skullLogo: UIWebView!
    
    @IBOutlet weak var SkullImageView: UIImageView!
    @IBOutlet weak var SkullLabel: UILabel!
    @IBOutlet weak var donate: UIButton!
    @IBOutlet weak var about: UIButton!
    @IBOutlet weak var gallery: UIButton!
    @IBOutlet weak var connect: UIButton!
    @IBOutlet weak var field: UIButton!
    @IBOutlet weak var news: UIButton!
    @IBOutlet var SkullView: UIView!
    var htmlpath: String? = nil
    var IHOfacts = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        SkullView.layer.borderColor=UIColor.white.cgColor
        SkullView.layer.borderWidth=2.0
        SkullView.layer.cornerRadius=5.0
        IHOfacts.append("The Institute of Human Origins (IHO) is one of the preeminent organizations in the world devoted to the science of human origins.")
        IHOfacts.append("IHO research on how we “became human” ranges from analysis of fossil teeth, skull development, and behavioral psychology to archaeology, paleoecology, and geology.")
        IHOfacts.append("IHO Founding Director Donald Johanson discovered the fossil bones known as \"Lucy\" in Hadar, Ethiopia, in 1974.")
        IHOfacts.append("IHO leads travel adventures to exciting places like the Galapagos Islands, French prehistoric caves, and South African research sites.")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(sender:)))
        tapGesture.delegate=self;
        SkullImageView.addGestureRecognizer(tapGesture)
        UINavigationBar.appearance().barTintColor = UIColor(red: CGFloat((255.0 / 255.0)), green: CGFloat((255.0 / 255.0)), blue: CGFloat((255.0 / 255.0)), alpha: CGFloat(1))
        
        // button sytle
        news.layer.cornerRadius = 15
        about.layer.cornerRadius = 15
        donate.layer.cornerRadius = 15
        gallery.layer.cornerRadius = 15
        connect.layer.cornerRadius = 15
        field.layer.cornerRadius = 15
        
        // ASU LOGO at navigation bar
        self.navigationController?.navigationBar.frame.size.height=50;
        var imageView: UIImageView?
        var ipad: Bool = (UIDevice.current.userInterfaceIdiom == .pad)
        
        // skull LOGO
        htmlpath = Bundle.main.path(forResource: "skull", ofType: "html")
        var html = try? String(contentsOfFile: htmlpath!, encoding: String.Encoding.utf8)
        var baseURL = URL(fileURLWithPath: "\(Bundle.main.bundlePath)")
        self.skullLogo.loadHTMLString(html!, baseURL: baseURL)
        skullLogo.scrollView.isScrollEnabled = false
        
        //toolbar
        let label = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(200), height: CGFloat(21)))
        label.text = "ASU IHO 2017"
        label.center = CGPoint(x: view.frame.midX, y: view.frame.height)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        
        
        let creditsButton = UIButton(frame: CGRect(x: CGFloat(-200), y: CGFloat(0), width: CGFloat(60), height: CGFloat(21)))
        creditsButton.backgroundColor = nil
        
        UIColor(red: CGFloat((0 / 255.0)), green: CGFloat((51 / 255.0)), blue: CGFloat((102 / 255.0)), alpha: CGFloat(1))
        creditsButton.setTitle("Credits", for: .normal)
        creditsButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        creditsButton.tag = 1
        self.view.addSubview(creditsButton)
        
        let toolbarButton = UIBarButtonItem(customView: creditsButton)
        let toolbarTitle = UIBarButtonItem(customView: label)
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.toolbarItems = [flexible,toolbarTitle,toolbarButton]
    }
    
    
    func imageTapped(sender: UITapGestureRecognizer? = nil) {
        let tapPoint=sender?.location(in: SkullImageView)
        if((tapPoint?.x)!>0&&(tapPoint?.x)!<SkullImageView.frame.size.width/2)
        {
            if((tapPoint?.y)!>0&&(tapPoint?.y)!<SkullImageView.frame.size.height/2)
            {
                SkullLabel.text=IHOfacts[0]
            }
            else
            {
                SkullLabel.text=IHOfacts[1]
            }
        }
        else
        {
            if((tapPoint?.y)!>0&&(tapPoint?.y)!<SkullImageView.frame.size.height/2)
            {
                SkullLabel.text=IHOfacts[2]
            }
            else
            {
                SkullLabel.text=IHOfacts[3]
            }
        }
        SkullView.frame=CGRect(x: 5, y: 5, width: SkullImageView.frame.size.width-10, height: SkullImageView.frame.size.height-10)
        SkullImageView.addSubview(SkullView)
    }
    
    
    
    func buttonAction(sender: UIButton!) {
        var btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            self.performSegue(withIdentifier: "CreditsSeque", sender: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat((255.0 / 255.0)), green: CGFloat((255.0 / 255.0)), blue: CGFloat((255.0 / 255.0)), alpha: CGFloat(1))
        self.navigationController?.setToolbarHidden(false, animated: false)
        self.navigationController?.navigationBar.isHidden=true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setToolbarHidden(true, animated: false)
    }
    
    @IBAction func skullCrossPressed(_ sender: Any) {
        SkullView.removeFromSuperview();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
}

