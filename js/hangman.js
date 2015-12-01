// GAME VARIABLES
var wordList = [
    'monkey',
    'zebra',
    'giraffe',
    'tiger',
    'elephant',
    'iguana',
    'hippopotamus',
    'rhinoceros',
    'chimpanzee',
    'orangutan',
    'hyena',
    'gorilla',
    'leopard',
    'bobcat',
    'flamingo',
    'alligator',
    'crocodile',
    'parrot',
    ];
var monkeyPics = [ 
    IMG_FILE1,
    IMG_FILE2,
    IMG_FILE3,
    IMG_FILE4,
    IMG_FILE5,
    IMG_FILE6,
];
var strikes = 0;
var num = Math.floor(Math.random() * wordList.length);
var secretWord = wordList[num];
var missedLetters = [];
var correctLetters = [];
var wordArray = secretWord.split("");

// FUNCTION TO TURN SECRET WORD LETTERS INTO BLANKS
function displayWord() {
    var results = [];
    // for each letter in wordArray
    for (var i = 0; i < wordArray.length; i++) {
        // if letter is in correctLetters
        if ($.inArray(wordArray[i], correctLetters) != -1) {
            // append letter
            results.push(wordArray[i]);
        } else {
            // append "_"
            results.push("_ ");
        } // end if-else
    } // end for loop
    var res = results.join("");
    return res;
} // end function displayWord

// START THE GAME WTIH A BLANK SECRET WORD
var startWord = displayWord();
$("#word-display").text(startWord);

// PLAY THE GAME WHEN CLICK "PICK A LETTER" BUTTON
$("#choose").click(function () {
    // disappear game directions
    $("#game-dirs").hide();
    // grab input value
    var myGuess = $('input:text').val();
    myGuess = myGuess.toLowerCase();
    // clear hint fields
    $("#strikes").text(" ");
    $("#missed-letters").text(" ");
    $("input:text").val("");
    // PLAY A TURN
    // if myGuess is in the secretWord:
    if ($.inArray(myGuess, wordArray) != -1) {
        // add letter to correctLetters
        correctLetters.push(myGuess);
        // clear secret word
        $("#word-display").text(" ");
        // display secret word
        var newWord = displayWord(wordArray);
        // if the word is complete
        if (newWord == secretWord) {
            // display win state
            $("#word-display").text(secretWord);
            $("#strikes").text("You win! Monkey lives!");
            $("#missed-letters").text("Monkey is SO happy.");
            $("#choose").hide();
            $("form").hide();
            $("#play-again").show();
        } else {
            $("#word-display").text(newWord);
            // change the display of strikes
            $("#strikes").text("Strikes: " + strikes);
            // change the display of missedLetters
            $("#missed-letters").text(missedLetters);
        }
    } else {
        // increase the strikes by one
        strikes += 1;
        // if strikes == 6:
        if (strikes == 6) {
            // display loss message
            $("#strikes").text("You lose. Monkey dies.");
            $("#missed-letters").text("The word was " + secretWord + ".");
            var lossPic = monkeyPics[5];
            $("img").attr("src", lossPic);
            $("#choose").hide();
            $("form").hide();
            $("#play-again").show();
        } else {
            // add myGuess to missedLetters
            missedLetters.push(myGuess);
            // change the display of strikes
            $("#strikes").text("Strikes: " + strikes);
            // change the display of missedLetters
            $("#missed-letters").text(missedLetters);
            // change the monkeyPic
            var newPic = monkeyPics[(strikes -1)];
            $("img").attr("src", newPic);
        } // end strike-check if/else
    } // end letter-check if/else
}); // end click function

$("#play-again").click(function() {
    location.reload(true);
}); // end click function