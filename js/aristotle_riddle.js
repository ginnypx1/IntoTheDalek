// VARIABLES

var winText = "<p>You turn away from that Dalek and point to the other one.  You tell the guards to release him.</p><p>They unlock the chains...</p><p>The Dalek does not kill you.  It's a miracle.</p><p>A good Dalek does exist.</p><p>The Doctor asks, 'Do you have a shrink ray on board?'</p><p>Journey Blue answers, 'Of course!'</p><p>The Doctor explains his plan: you'll use the shrink ray to journey inside the good Dalek's mind.</p><p>You wait patiently while the shrink ray warms up...</p><p>5... 4... 3... 2... 1...</p>";

var loseText = "<p>You tell the guards to release the Dalek.</p><p>They unlock the chains...</p><p>The Dalek opens fire...</p>";

var title = "<h1>Hold your breath:</h1>"

// GAME FUNCTIONS
// if yes, play riddle game
$("#yes").click(function () {
    $(".game-window").show();
    $(".entry-text").hide();
});
// if no, end game before it even starts
$("#no").click(function () {
    $(".no-go").show();
    $(".entry-text").hide();
});
// Return to the home screen to play again
$("#play-again").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/';
});
// when next button clicked, move to cortex vault
$("#next").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/cortex_vault.html';
});
// when death button clicked, move to death page
$("#death").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/death.html';
}); 

// SOLVE THE RIDDLE
$("#ask-question").click(function() {
    // grab my_guess in the input box
    var my_guess = $("input:text").val();
    // my_guess to lower case
    my_guess = my_guess.toLowerCase();
    // if other in answer 
    var correct = my_guess.search("other");
    if (correct !== -1) {
        $(".game-window").hide();
        $(".forward").show();
        $("#death").hide();
        // in .forward-motion, add directions: 
        $(".forward-motion").prepend(winText);
        $(".forward-title").prepend(title).addClass("title-two");
    } else {
        $(".game-window").hide();
        $(".forward").show();
        $("#next").hide();
        // in .forward-motion, show death sentence:
        $(".forward-motion").prepend(loseText);  
        $(".forward-title").prepend(title).addClass("title-two");
    }
});
