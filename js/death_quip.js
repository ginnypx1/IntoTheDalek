// GAME VARIABLES
 var quips = [
        "<p>You are the Doctor! You are the enemy of the Daleks! You are dead!</p>",
        "<p>Exterminate!</p>",
        "<p>Only one race can survive!</p>",
        "<p>Attack and Destroy!</p>",
        "<p>You will be exterminated!</p>",
        "<p>Your forces will be exterminated! Annihilate!</p><p>EXTERMINATE!</p>",
        "<p>All enemies of the Daleks must be destroyed!</p><p>Exterminate!</p>",
        "<p>Seek! Locate! Exterminate!</p>",
        "<p>Nothing must interfere with the true destiny of the Daleks!!</p><p>You must be exterminated! Exterminated! EXTERMINATED!!</p>",
        "<p>YOU ARE AN ENEMY OF THE DALEKS! YOU MUST BE DESTROYED!!</p>",
];

// GAME FUNCTIONS

// Return to the home screen to play again
$("#play-again").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/';
});

// DIE

// When document ready,
$(document).ready(function () {
    // randomly pick quip from quips array
    var randNum = Math.floor((Math.random() * 10 + 1) - 1);
    var quip = quips[randNum];
    // load onto entry text
    $(".quip").prepend(quip);
});
    
