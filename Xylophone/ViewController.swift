import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        // Reduce button pressed's opacity to half
        sender.alpha = 0.5
        
        playSound(soundName: sender.currentTitle!)
        
        // Wait before reverting opacity value
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Return opacity to normal
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
