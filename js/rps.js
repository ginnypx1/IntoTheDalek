// GAME VARIABLES

var winText = "<p>No garbage for you.  Unfortunately, that means the second you walk out the door... You are attacked and killed.</p>";
var loseText = "<p>You take a deep breath....  And cover yourself in garbage.</p><p>You step outside. It works! The Dalek ignores you.  Now... You must follow the source of the radiation...  and stop the leak in order to complete your quest.</p><p>You make a run for the Power Center.</p>";
var drawText = "<p>It's a draw. Throw again.</p>";
var choices = ["Rock", "Paper", "Sonic Screwdriver"];
var winTitle = "You Win!";
var loseTitle = "You Lose!";

// GAME FUNCTIONS
$("#start").click(function () {
    $(".game-window").show();
    $(".entry-text").hide();
});
// when next button clicked, move to waste center
$("#next").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/power_center.html';
});
// when death button clicked, move to death page
$("#death").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/death.html';
}); 

// ROCK PAPER SONIC SCREWDRIVER

// When throw button is clicked
$("#throw").click(function () {
    // randomly pick rock paper or scissors
    var randNum = Math.floor((Math.random() * 3) + 1) - 1;
    var drHand = choices[randNum];
    // clear .game-results
    $(".game-results").text(" ");
    // grab value from radio form, set as var hand
    var hand = $(".game-play input[type='radio']:checked").val();
    // testing
    console.log(drHand);
    console.log(hand);
    // check values for win or loss
    if ((drHand == 'Paper' && hand == 'Sonic Screwdriver') || (drHand == 'Sonic Screwdriver' && hand == 'Rock') || (drHand == 'Rock' && hand == 'Paper')) {
        // redirect to death
        $(".game-play").hide();
        $(".forward").show();
        $("#next").hide();
        // display winText
        $(".game-results").prepend(winText);
        $(".title-two").text(winTitle);
        // display drHand vs. hand
        $(".game-results").prepend("<p>" + drHand + " vs. " + hand + "</p>");
    } else if ((drHand == 'Rock' && hand == 'Sonic Screwdriver') || (drHand == 'Paper' && hand == 'Rock') || (drHand == 'Sonic Screwdriver' && hand == 'Paper')) {
        // redirect to power_center
        $(".game-play").hide();
        $(".forward").show();
        $("#death").hide();
        // disply loseText
        $(".game-results").prepend(loseText);
        $(".title-two").text(loseTitle);
        // display drHand vs. hand
        $(".game-results").prepend("<p>" + drHand + " vs. " + hand + "</p>");
    } else {
        // display drawText
        $(".game-results").prepend(drawText);
        // display drHand vs. hand
        $(".game-results").prepend("<p>" + drHand + " vs. " + hand + "</p>");
    }  
});