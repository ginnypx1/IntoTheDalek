var appleText = "<p>The Dalek starts to laugh.  'I know this one!' he says.  'An apple a day... Keeps the Doctor away! HA HA HA HA HA!'</p><p>You look at the Doctor.  He isn't amused.</p><p>The link fails. The Daleks attack!</p>";
var skinText = "<p>'I know this one!' the Doctor says.  'EXFOLIATE!'  The Doctor cracks up and smacks his knee.  'HA HA HA HA HA!'</p><p>You look around the inside of the Dalek.  You can both tell by the flashing red lights. He isn't amused.</p><p>The link fails. The Daleks attack!</p>";
var roadText = "<p>'To exterminate humanity!' The Doctor and the Dalek yell at the same time. 'HA HA HA HA HA!'</p><p>The ship fills with laughter.  Then something wonderful happens.  All the images around you become the star being born.  It's beautiful. Mesmerizing. You are transported.  ...And so are the Doctor and the Dalek.</p><p>The Dalek tears up.  'How could you destroy when creation is so wonderful?' he says.</p><p>He is good again.</p>";

// GAME FUNCTIONS
$("#start").click(function () {
    $(".game-window").show();
    $(".entry-text").hide();
});
// when next button clicked, move to waste center
$("#next").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/victory.html';
});
// when death button clicked, move to death page
$("#death").click(function () {
    window.location.href='http://ginnypx1.github.io/IntoTheDalek/death.html';
}); 

// TELL A JOKE

// When joke button is clicked
$("#joke").click(function () {
    $(".game-play").hide();
    // grab value from radio form, set as var joke
    var joke = $(".game-play input[type='radio']:checked").val();
    // check values for which joke is told
    if (joke == "apples") {
        // redirect to death
        $(".forward-motion").show();
        $("#next").hide();
        // display appleText
        $(".forward-motion").prepend(appleText);
    } else if (joke == "skin") {
        // redirect to death
        $(".forward-motion").show();
        $("#next").hide();
        // disply skinText
        $(".forward-motion").prepend(skinText);
    } else {
        // redirect to victory
        $(".forward-motion").show();
        $("#death").hide();
        // display roadText
        $(".forward-motion").prepend(roadText);
    }  
});