//
//  FirstViewController.swift
//  AudioAndVideoPlayFromAssetCatalogSample
//
//  Created by hiraya.shingo on 2017/03/15.
//  Copyright © 2017年 shingohry. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class FirstViewController: UIViewController {
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? AVPlayerViewController,
            segue.identifier == "AVPlayerViewController" else {
            return
        }
        
        // Load movie from asset catalog
        
        let asset = NSDataAsset(name:"movie")
        
        let videoUrl = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("movie.mp4")
        try! asset!.data.write(to: videoUrl)
        
        let item = AVPlayerItem(url: videoUrl)
        destination.player = AVPlayer(playerItem: item)
    }
    
    @IBAction func didTapPlaySoundButton(_ sender: Any) {
        // Load sound from asset catalog
        
        let asset = NSDataAsset(name:"sound")
        player = try! AVAudioPlayer(data:asset!.data,
                                    fileTypeHint:"m4a")
        player!.play()
    }
}

