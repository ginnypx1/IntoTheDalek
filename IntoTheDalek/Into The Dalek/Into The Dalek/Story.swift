//
//  StoryModel.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import Foundation

// types of possible pages in the story
enum PageType {
    case storyView
    case choiceView
    case riddleView
    case codeView
    case rpssView
    case laserView
    case jokeView
    case victoryView
}

struct Story {
    // story array of text/PageType
    let storyText : [[String : Any]] = [
        ["pageText": "  The Tardis flickers to life in the control room of the 'Aristotle'.\n\n  You open the door and shake yourself off, get your bearings. You and the Doctor have just rescued the rebel fighter Journey Blue. Her shuttle was under attack from the Daleks.\n\n  Your Tardis stumbled into the battle and you joined the fight. Now you have returned her safely to her rebel base ship. You expect to enter to cheers, but instead, there is only silence...", "pageType": PageType.storyView],
        ["pageText": "  You are surrounded by soldiers with guns. The rebel officers have been waiting for you. They explain: They have captured a strange Dalek and they need your help.\n\n  This strange new Dalek appears to be... GOOD.\n\n  Will you help confirm the existence of a good Dalek?", "pageType": PageType.choiceView], // choiceView text
        ["pageText": "  The rebel officers step aside. Two Daleks are wheeled into the center of the room. One is the 'good' Dalek. The other is evil.\n\n  The officers will let you choose one Dalek... But upon doing so you must release it from its chains.\n\n  You can ask one Dalek one question.\n\n  You assume, as is the case with all Daleks... that the real Dalek will only lie. The good Dalek must only tell the truth.\n\n  What question do you ask?", "pageType": PageType.storyView],
        ["pageText": "Remember:\n\nOne Dalek lies.\n\nThe other tells the truth.\n\nYou decide to ask the Dalek on the left:", "pageType": PageType.riddleView], // riddleView text
        ["pageText": "  You turn away from that Dalek and point to the other one. You tell the guards to release him.\n\n  They unlock the chains...\n\n  The Dalek does not kill you. It's a miracle.\n\n  A good Dalek does exist.\n\n  The Doctor asks, 'Do you have a shrink ray on board?'\n\n  Journey Blue answers, 'Of course!'\n\n  The Doctor explains his plan: you'll use the shrink ray to journey inside the good Dalek's mind.\n\n  You wait patiently while the shrink ray warms up...\n\n  5... 4... 3... 2... 1...","pageType": PageType.storyView],
        ["pageText": "  You find yourself inside a metal hallway, black with red lights. There are wires everywhere. This is a very complicated machine.\n\n  The Doctor explains that this room forms the Dalek's cortex vault. Dalek technology designed this vault to suppress any compassion... And also to store all of the Dalek's memories.\n\n  There's a simple keypad lock on the Dalek's central vault.\n\n  'Good news!' The Doctor says. 'Only 3 digits... And the Daleks only know 1s and 0s. This should be fairly easy to crack...'\n\n  'But we only get 5 tries, before it shuts down for 24 hours.'", "pageType": PageType.storyView],
        ["pageText": "  ", "pageType": PageType.codeView], // codeView text
        ["pageText": "  POP!\n\n The Dalek vault opens. Journey Blue steps forward and sticks her hand inside.\n\n  'Wrong move,' says the Doctor.\n\n  You watch as the Dalek unleashes an attack force... A squadron of super-fast autonomic antibodies that attack what is giving them pain... They surround Journey Blue and they EXTERMINATE.\n\n  The Doctor shouts, 'We have to find somewhere unguarded! Run!'", "pageType": PageType.storyView],
        ["pageText": "  The waste center looks like the inside of a giant garbage dumpster.\n\n  While you clean off your shoes, the Doctor whips out his sonic screwdriver. He takes some atmospheric readings. He confirms -- this area is unguarded. But something very nearby is emitting a very high degree of radiation. You cannot stay inside this area for long...\n\n  You must leave. You must find the source of radiation. But how can you camouflage yourself?\n\n  The Doctor suggests you rub just enough garbage on yourself... '...to cover the smell.'\n\n  Yuck. You don't want to.\n\nThe Doctor suggests you solve the impasse with a game of RPSS.", "pageType": PageType.storyView],
        ["pageText": "  'Rock, Paper, Scissors?' you ask.\n\n  'Of course not! Rock, Paper, Sonic Screwdriver.'", "pageType": PageType.rpssView], // rpssView text
        ["pageText": "  You Lose!\n\n  You take a deep breath.... And cover yourself in garbage.\n\n  You step outside. It works! The Dalek ignores you. Now... You must follow the source of the radiation... and stop the leak in order to complete your quest.\n\n  You make a run for the Power Center.", "pageType": PageType.storyView],
        ["pageText": "  You find yourself inside what looks to be the guts of a central computer. Wires, links and gauges are everywhere.\n\n  The Doctor swings his sonic screwdriver around... 'There!' He shouts, pointing to a large ray of light. 'The radiation leak!'\n\n  You must plug the leak so you can continue your quest.\n\n  The Doctor hands you his sonic screwdriver.\n\n  'You shoot while I twist the right wires!' he orders.\n\n  Are you ready?", "pageType": PageType.storyView],
        ["pageText": "  ", "pageType": PageType.laserView],// laserView text
        ["pageText":"  The dust settles. Everything goes quiet. You look to the Doctor.\n\n  'It worked,' he says. 'It is sealed.'\n\n  However, you both know... something is very, very wrong...\n\n  By stopping the leak, you 'fixed' the Dalek. He reverts to his old evil ways and contacts the main Dalek ship. You only have a few moments before a large scale Dalek attack hits...\n\n  'Quick!' The Doctor yells. 'We must find his consciousness! We must discover what made him believe he was GOOD...'", "pageType": PageType.storyView],
        ["pageText": "  You find yourself inside a giant dome. Images, moving pictures, are all around you. Most are horrific images of war, carnage, violence.\n\n  The Doctor explains that these are the Dalek's memories. He urges you to look away. They will only destroy your soul.", "pageType": PageType.storyView],
        ["pageText": "  But you see one memory that is shockingly beautiful... You move in closer....\n\n  The Doctor explains that you're watching the creation of a star. This could be it. This could be the memory you're looking for...\n\n  'I need to form a link to the Dalek brain...', the Doctor explains. 'I need him to think he is seeing this again for the first time.'\n\n  'Quick. Tell us a joke. If we both laugh ...I may be able to sync up with his brain.'\n\n  Know any good jokes?", "pageType": PageType.storyView],
        ["pageText": "  ", "pageType": PageType.jokeView], // jokeView text
        ["pageText": "  Ha! Good one!\n\n  'To exterminate humanity!' The Doctor and the Dalek yell at the same time. 'HA HA HA HA HA!'\n\n  The ship fills with laughter. Then something wonderful happens. All the images around you become the star being born. It's beautiful. Mesmerizing. You are transported. ...And so are the Doctor and the Dalek.\n\n  The Dalek tears up. 'How could you destroy when creation is so wonderful?' he says.\n\n  He is good again.", "pageType": PageType.storyView],
        ["pageText": "  Victory!\n\n  You tumble out of the Dalek... and find yourself back in the control room of the 'Aristotle.'\n\n  The Doctor stares intensely at the 'good' Dalek. You can tell - He is disturbed... The Dalek only saw darkness inside him. You try to reassure him that it all worked out anyways. 'But it would have been nice if we could have figured out how to make them all good...'", "pageType": PageType.storyView],
        ["pageText": "  The good Dalek sends a signal to his mothership. He tells the rest of the Dalek force: 'The 'Aristotle' has been destroyed.' The rebels can now operate completely under the Dalek radar.\n\n  You leave them with a new soldier -- the good Dalek.\n\n  You hop on the Tardis and turn the key.\n\n  A new adventure awaits...", "pageType": PageType.victoryView]] // victoryView text
    
    // when games are lost, these messages should be displayed
    let endText: [String] = [
        // do not choose to help
        "You are shoved back in your Tardis and released into space.",
        // lose riddle
        "  You tell the guards to release the Dalek.\n\n  They unlock the chains...\n\n  The Dalek opens fire...",
        // lose crack code
        "BZZZ!\n\n  The Dalek vault shuts down... Journey Blue shoots it.\n\n  'Wrong move,' says the Doctor. A squadron of super-fast autonomic antibodies attack what is giving them pain...\n\n  They surround you...",
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
    
    // tag on all the deaths
    let deathText = "Extermination Successful.\n\nThe human race is dead.\n\nCare to rewind the tardis and try it all again?"
    
    // random joke to go with each death
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
