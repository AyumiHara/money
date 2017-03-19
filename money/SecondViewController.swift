//
//  SecondViewController.swift
//  money
//
//  Created by 原 あゆみ on 2017/03/18.
//  Copyright © 2017年 原 あゆみ. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController,AVAudioPlayerDelegate {
    
    @IBOutlet var gatyaImageView : UIImageView?
    @IBOutlet var stopButton :UIButton?
    
    var audioPlayer:AVAudioPlayer!
    var music : String!
    var timer : Timer?
    var gatyaImageNo : Int = 0



    override func viewDidLoad() {
        super.viewDidLoad()
        
        music = "nc93579"
        audioPlay()
        audioPlayer.play()
        
        let image1 = UIImage(named:"gachagacha　bighi.png")!
        let image2 = UIImage(named:"gachagacha　smami.png")!
        let image3 = UIImage(named:"gachagacha　bigmi.png")!
       
        
        var imageListArray :Array<UIImage> = []
        // UIImage 各要素を追加、ちょっと冗長的ですが...
        imageListArray.append(image1)
        imageListArray.append(image2)
        imageListArray.append(image3)
      
       gatyaImageView?.image = UIImage(named:"gachagacha　bighi.png")!
       gatyaImageView?.animationImages = imageListArray
        // 1.5秒間隔
        gatyaImageView?.animationDuration = 0.5
        // 3回繰り返し
        gatyaImageView?.animationRepeatCount = 0
        
        // アニメーションを開始
        gatyaImageView?.startAnimating()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayImage() {
        
    }
    
    

    
    
    func audioPlay(){
        
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: music, ofType: "wav")!)
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
    
    
    @IBAction func stop() {
        audioPlayer.stop()
        gatyaImageView?.stopAnimating()
        
    }
    
    
    
    func segueToSecondViewController() {
       
        self.performSegue(withIdentifier: "toThiredViewController", sender: nil)
       
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
