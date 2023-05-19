//
//  ViewController + Animation.swift
//  NewYorkSchoolsTest
//
//  Created by Brandon Suarez on 5/19/23.
//

import Foundation
import Lottie

extension ViewController {
    
    func playAnimation() {
        animationView.animation = LottieAnimation.named("Paperplane")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.backgroundColor = .white
        
        addAnimation(animation: animationView)
        animationView.play()
        stopAnimation()

    }
    
    private func stopAnimation() {
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.animationView.stop()
            self.animationView.isHidden = true
        }

    }
    
    private func addAnimation(animation: LottieAnimationView) {
        view.addSubview(animation)
        animation.frame = view.frame
    }
}
