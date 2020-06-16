//
//  SubjectsViewController.swift
//  Moallem iOS Task
//
//  Created by Abdalla Shawky on 6/15/20.
//  Copyright © 2020 Abdalla Shawky. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class SubjectsViewController: UIViewController {
    
   private var subjects = ["Physics","Biology","History","Algebra","Math","Arabic","Science"]
   private var recentlyPlayed = ["RPReplay_Final1592259207","RPReplay_Final1592259248","RPReplay_Final1592259298"]
    
    @IBOutlet weak var subjectsCollectionView: UICollectionView!
    @IBOutlet weak var recentlyPlayedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpDelegates()
    }
    
    private func settingUpDelegates() {
         subjectsCollectionView.dataSource = self
         recentlyPlayedCollectionView.delegate = self
         recentlyPlayedCollectionView.dataSource = self
     }
     
    private func playVideo(for indexPath: IndexPath) {
        guard let path = Bundle.main.path(forResource: recentlyPlayed[indexPath.row], ofType:"mov") else {
            print("video is not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    private func createThumbnail(for indexPath:IndexPath) -> UIImage?{
        let path = Bundle.main.url(forResource: recentlyPlayed[indexPath.row], withExtension: "mov")
        do {
            let asset = AVURLAsset(url: path!, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 3, timescale: 4), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
        }
        return nil
    }
}

extension SubjectsViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case subjectsCollectionView:
            return subjects.count
        default:
            return recentlyPlayed.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case subjectsCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectCell", for: indexPath) as? SubjectsCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.subjectNameLabel.text = subjects[indexPath.row]
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentlyPlayedCollectionViewCell", for: indexPath) as? RecentlyPlayedCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.adjustVideoThumbnail(for: createThumbnail(for: indexPath) ?? UIImage())
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playVideo(for: indexPath)
    }
    
}
