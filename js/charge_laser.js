// GAME VARIABLES

var winText = "<p>Everything goes quiet. You look to the Doctor.  'It worked,' he says. 'It is sealed.'</p><p>However, you both know... something is very, very wrong...</p><p>By stopping the leak, you 'fixed' the Dalek.  He reverts to his old evil ways and contacts the main Dalek ship.  You only have a few moments before a large scale Dalek attack hits...</p><p>'Quick!' The Doctor yells. 'We must find his consciousness! We must discover what made him believe he was GOOD...'</p>";
var loseText = "<p>Your attack was not enough!  You must try again!  ...But you're too weak! You can't press the button!</p><p>You feel yourself fading away...</p>";
var count = 0;

// GAME FUNCTIONS

$("#start").click(function () {
    $(".game-window").show();
    $(".entry-text").hide();
});
// when next button clicked, move to consciousness link
$("#next").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/consciousness_link.html';
});
// when death button clicked, move to death
$("#death").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/death.html';
});

// SHOOT THE LASER

// When the shoot button is clicked
$("#shoot").click(function () {
    // create a shoot graphic
    var pop = "<h2>POP!</h2>";
    // put it inside the shoot flexbox
    $(".laser").prepend(pop);
    // increase count by 1
    count += 1;
});

$("#done").click(function () {
// When done button is clicked
    $(".game-window").hide();
    // if count > 10
    if (count >= 10) {
        // redirect to victory
        $(".forward-motion").show();
        $("#death").hide();
        $(".forward-motion").prepend(winText);
    } else {
        // redirect to death
        $(".forward-motion").show();
        $("#next").hide();
        $(".forward-motion").prepend(loseText);
    }
});