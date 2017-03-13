//
//  DeathModel.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/12/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation


struct Death {

    var deathText: String = "Extermination Successful.\n\nThe human race is dead.\n\nCare to rewind the tardis and try it all again?"
    var deathNumber: Int = 0
    var ending: String
    var deathQuip: String
    
    init(page: Page) {
        self.deathNumber = page.deathNumber
        self.ending = endText[page.deathNumber]
        self.deathQuip = deathQuips[Int(arc4random_uniform(UInt32(self.deathQuips.count)))]
    }
    
    // message displayed when game is lost
    let endText: [String] = [
        // do not choose to help
        "You are shoved back in your Tardis and released into space.",
        // lose riddle
        "  You tell the guards to release the Dalek.\n\n  They unlock the chains...\n\n  The Dalek opens fire...",
        // lose crack code
        "BZZZ!\n\n  The Dalek vault shuts down...\n\n  Journey Blue shoots it.\n\n  'Wrong move,' says the Doctor. A squadron of super-fast autonomic antibodies attack what is giving them pain...\n\n  They surround you...",
        // win rpss
        "You Win!\n\n No garbage for you. Unfortunately, that means the second you walk out the door... You are attacked and killed.",
        // lose laser (too little power)
        "The dust settles: Your attack was not strong enough! You must try again!\n\n  ...But you're too weak! You can't press the button!\n\n  You feel yourself fading away...",
        // lose laser (too much power)
        "Your attack was too strong! You melted the ship!\n\n  ...You float into the vastness of space...",
        // tell wrong joke apple
        "The Dalek starts to laugh.\n\n  'An apple a day... Keeps the Doctor away! HA HA HA HA HA!'\n\n  You look at the Doctor. He isn't amused.\n\n  The link fails. The Daleks attack!",
        // tell wrong joke skin
        "'EXFOLIATE!' The Doctor cracks up and smacks his knee. 'HA HA HA HA HA!'\n\n  You look around the inside of the Dalek. You can both tell by the flashing red lights. He isn't amused.\n\n  The link fails. The Daleks attack!"]

    // what the Daleks say as you die
    let deathQuips: [String] = [
        "YOU ARE AN ENEMY OF THE DALEKS! YOU MUST BE DESTROYED!!",
        "Attack and Destroy!",
        "You are the Doctor! You are the enemy of the Daleks! You are dead!",
        "Exterminate!",
        "Only one race can survive!",
        "You will be exterminated!",
        "Your forces will be exterminated! Annihilate!\n\nEXTERMINATE!",
        "All enemies of the Daleks must be destroyed!\n\nExterminate!",
        "Seek! Locate! Exterminate!",
        "Nothing must interfere with the true destiny of the Daleks!!\n\nYou must be exterminated! Exterminated! EXTERMINATED!!"]
}
