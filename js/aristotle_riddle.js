// VARIABLES

var winText = "<p>You turn away from that Dalek and point to the other one.  You tell the guards to release him. They unlock the chains.  You all hold your breath... The Dalek does not kill you.  It's a miracle. A good Dalek does exist.</p><p>The Doctor asks, 'Do you have a shrink ray on board?'  Journey Blue answers, 'Of course!'  The Doctor explains his plan: you'll use the shrink ray.  You will journey into the good Dalek's mind.  You wait patiently while the shrink ray warms up...</p><p>5... 4... 3... 2... 1...</p>";

var loseText = "<p>You tell the guards to release the Dalek.  They unlock the chains.  You all hold your breath...  The Dalek opens fire...</p>";

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
        $(".forward-motion").show();
        $("#death").hide();
        // in .forward-motion, add directions: 
        $(".forward-motion").prepend(winText);
    } else {
        $(".game-window").hide();
        $(".forward-motion").show();
        $("#next").hide();
        // in .forward-motion, show death sentence:
        $(".forward-motion").prepend(loseText);  
    }
});
