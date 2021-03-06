// Game variables

// generate a random three digit code of 1s & 0s
var x = Math.floor((Math.random() * 2) + 1) - 1;
var y = Math.floor((Math.random() * 2) + 1) - 1;
var z = Math.floor((Math.random() * 2) + 1) - 1;
var code = String(x) + String(y) + String(z);

var count = 0;
var alreadyGuessed = [];
var winText = "<p>The Dalek vault opens.  Journey Blue steps forward and sticks her hand inside.</p><p>'Wrong move,' says the Doctor.</p><p>You watch as the Dalek unleashes an attack force... A squadron of super-fast autonomic antibodies that attack what is giving them pain...  They surround Journey Blue and they EXTERMINATE.</p><p>The Doctor shouts, 'We have to find somewhere unguarded! Run!'</p>"
var loseText = "<p>The Dalek vault shuts down...</p><p>Journey Blue gets out her grapple hook and shoots it.</p><p>'Wrong move,' says the Doctor.  You watch as the Dalek unleashes an attack force...  A squadron of super-fast autonomic antibodies that attack what is giving them pain...</p><p>They surround you all and they EXTERMINATE.</p>"
var guessAgain = "BZZZZZZ. Incorrect. Try again."
var winTitle = "<h1>POP!</h1>";
var lossTitle = "<h1>BZZ!</h1>";


// GAME FUNCTIONS
$("#start").click(function () {
    $(".game-window").show();
    $(".entry-text").hide();
});
// when next button clicked, move to waste center
$("#next").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/waste_center.html';
});
// when death button clicked, move to death page
$("#death").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/death.html';
}); 

// CRACK THE CODE

// When #guess-code button is pressed
$("#guess-code").click(function() { 
    // clear .game-directions
    $(".game-directions").text(" ");
    // grab the guess from the input
    var guess = $("input:text").val();
    // add the guess to alreadyGuessed
    alreadyGuessed.push(guess);
    var guessString = alreadyGuessed.join(", ");
    // increase the count by one
    count += 1;
    // testing
    console.log(code);
    // if guess == code:
    if (guess === code) {
        $(".game-window").hide();
        $(".forward").show();
        // redirect to waste center
        $("#death").hide();
        // display winText
        $(".forward-motion").prepend(winText);
        $(".forward-title").prepend(winTitle).addClass("title-two");
    // else if count == 5:
    } else if (count === 5) {
        $(".game-window").hide();
        $(".forward").show();
        // redirect to death
        $("#next").hide();
        // display lossText
        $(".forward-motion").prepend(loseText);
        $(".forward-title").prepend(lossTitle).addClass("title-two");
    // else:
    } else {
        // display guessesRemaining
        $(".game-directions").prepend("<p>" + (5 - count) + " guess(es) remaining.</p>");
        // display guessesTried
        $(".game-directions").prepend("<p>You've tried the codes: " + guessString + "</p>");
        // display guessAgain
        $(".game-directions").prepend("<h2>BZZZZZZ. Guess Again.</h2>");
    }
});
