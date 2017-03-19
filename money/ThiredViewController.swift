//
//  ThiredViewController.swift
//  money
//
//  Created by 原 あゆみ on 2017/03/18.
//  Copyright © 2017年 原 あゆみ. All rights reserved.
//

import UIKit
import AVFoundation

class ThiredViewController: UIViewController,AVAudioPlayerDelegate {
    
    @IBOutlet var resultImageView : UIImageView?
    @IBOutlet var haikeiImageView : UIImageView?
    @IBOutlet var offImageView : UIImageView?
    
    let number = Int(arc4random_uniform(10))
    
    var resultArray :[UIImage]!
    var audioPlayer:AVAudioPlayer!
    var music : String!
    
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let audioPath = Bundle.main.path(forResource: music, ofType:"mp3")!
        
        resultArray = [UIImage(named:"0001.JPG")!,UIImage(named:"0002.JPG")!,UIImage(named:"0003.JPG")!,UIImage(named:"0004.JPG")!,UIImage(named:"0005.JPG")!,UIImage(named:"0006.JPG")!,UIImage(named:"0007.JPG")!,UIImage(named:"0008.JPG")!,UIImage(named:"0009.JPG")!,UIImage(named:"0010.JPG")!]
        
        
        resultImageView?.image = resultArray[number]
        
        print(number)
        
        
        if number == 9 {
            haikeiImageView?.image = UIImage(named:"bg_red@2x")
            music = String("ji_039")
            audioPlay()
            audioPlayer.play()
            offImageView?.image = UIImage(named:"10%off.png")
            print(music)
        } else  {
            haikeiImageView?.image = UIImage(named:"bg_blue@2x")
            music = String("ji_023")
            audioPlay()
            audioPlayer.play()
            offImageView?.image = UIImage(named:"5%off.png")
            print(music)
        }
       
        
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segueToSecondViewController() {
        self.performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = 0.0
        animation.toValue = 2 * M_PI
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        animation.duration = 5.0
        animation.repeatCount = Float.infinity
        haikeiImageView?.layer.add(animation, forKey: nil)
    }
    
    func audioPlay(){
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: music, ofType: "mp3")!)
        //        let audioUrl = URL(fileURLWithPath: audioPath)
        
        
        var audioError:NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioPath as URL)
        } catch let error as NSError {
            audioError = error
            audioPlayer = nil
        }
        
        // エラーが起きたとき
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        

        
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
