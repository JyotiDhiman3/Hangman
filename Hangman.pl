#Name - Jyoti Dhiman
#Entry Number - 2020CSB1092
my @guessed_letters = ();    #array to store the correctly guessed words
my @wrong_guesses   = ();    #array to store the wrong guesses
my $result          = 0;     #to end the game if the result is a win
my $tries_made      = 0;     #to count the number of guesses made
my @sample_words    = (      #sample of words to choose from
    "computer",      "radio",        "calculator",    "teacher",
    "bureau",        "police",       "geometry",      "president",
    "subject",       "country",      "enviroment",    "classroom",
    "animals",       "province",     "month",         "politics",
    "puzzle",        "instrument",   "kitchen",       "language",
    "vampire",       "ghost",        "solution",      "service",
    "software",      "virus25",      "security",      "phonenumber",
    "expert",        "website",      "agreement",     "support",
    "compatibility", "advanced",     "search",        "triathlon",
    "immediately",   "encyclopedia", "endurance",     "distance",
    "nature",        "history",      "organization",  "international",
    "championship",  "government",   "popularity",    "thousand",
    "feature",       "wetsuit",      "fitness",       "legendary",
    "variation",     "equal",        "approximately", "segment",
    "priority",      "physics",      "branche",       "science",
    "mathematics",   "lightning",    "dispersion",    "accelerator",
    "detector",      "terminology",  "design",        "operation",
    "foundation",    "application",  "prediction",    "reference",
    "measurement",   "concept",      "perspective",   "overview",
    "position",      "airplane",     "symmetry",      "dimension",
    "toxic",         "algebra",      "illustration",  "classic",
    "verification",  "citation",     "unusual",       "resource",
    "analysis",      "license",      "comedy",        "screenplay",
    "production",    "release",      "emphasis",      "director",
    "trademark",     "vehicle",      "aircraft",      "experiment"
);

my $codeword = @sample_words[ rand( $#sample_words + 1 ) ]
  ; #randomly selecting the main codeword using a random function from the sample array
my $size_codeword = length($codeword)
  ;    #getting the length of the main codeword that is to be guessed

for ( my $i = 0 ; $i < $size_codeword ; $i++ )
{    #assignin "_" to guessed letter array as many times as the size of codeword
    $guessed_letters[$i] = '_';
}
while ( $result == 0 ) {
    &drawHangman( $tries_made, $codeword )
      ;    #drawing the hangman according to the number of guesses made
    print "\nIncorrect guesses are : \n";
    $size_wrong_guesses = @wrong_guesses;  #printing the incorrect guesses array
    for ( my $j = 0 ; $j < $size_wrong_guesses ; $j++ ) {
        print $wrong_guesses [$j] . " ";
    }
    print "\n";
    print "\nGuessed Word : \n";           #printing the so far guessed array
    $size_guessed_letters = @guessed_letters;
    for ( my $i = 0 ; $i < $size_guessed_letters ; $i++ ) {
        print $guessed_letters [$i] . " ";
    }
    print "\n";

    print "\n\nEnter a letter: ";          #taking the input
    my $input_letter = <>;
    chomp($input_letter);                  # to remove newline
    &Update( $codeword, $input_letter )
      ;                      #updating the incorrect and correctly guessed array
    my $eachletter_codeword; #to take each character of the codeword
    $x = 1;                  #used as a flag
    for ( my $i = 0 ; $i < length($codeword) ; $i++ ) {
        $eachletter_codeword = substr( $codeword, $i, 1 );
        if ( $eachletter_codeword ne $guessed_letters[$i] )
        { #if any of the character of codeword is not found in the guessed letters switch flag
            $x = 0;
        }
    }
    if ( $x == 1 ) {
        $result =
          1;   #making the result 1 meaning all letter are correctly guessed now
    }

}
if ( $result == 1 ) {    #printing the word and winning message
    print "The codeword is: " . $codeword . "\n";
    print "\nYeah !!! You Win !!!\n";
}

#subroutine to update the wrong_guessed array and correct_guessed array
sub Update {
    my ( $codeword, $input_letter ) = @_;
    my $letterIndex = index( $codeword, $input_letter )
      ;    #checking if the input_letter is present in the codeword
    my $flag = 0;    #a flag to check if the word is already guessed or not
    if ( $letterIndex == -1 ) {
        for ( my $i = 0 ; $i < $#wrong_guesses + 1 ; $i++ ) {
            if ( $input_letter eq $wrong_guesses[$i] )
            {        #checking if the input letter is already wrongly guessed
                print "You already guessed $input_letter!\n";
                $flag = 1;
            }
        }
        if ( $flag == 0 )
        { #if the letter is not present then pushing the letter into the wrong_guesses array
            print "Wrong!\n";
            push( @wrong_guesses, $input_letter );
            $tries_made++;    #increamenting the tries_made variable
        }
    }
    else {
        for ( my $i = 0 ; $i < length($codeword) ; $i++ )
        {    #checking if the input letter is already correctly guessed
            my $c_letter = substr( $codeword, $i, 1 );
            if ( $input_letter eq $guessed_letters[$i] ) {
                print "You already guessed $input_letter!\n";
            }
            if ( $input_letter eq $c_letter )
            {    #if not then updating the guessed letters array
                $guessed_letters[$i] = $c_letter;
            }
        }
    }
}

#sub-routine to draw the Hangman according to number of tries made so far
sub drawHangman {
    my ( $misses, $codeword ) = @_;
    if ( $misses == 0 ) {
        print "  +---+ \n";
        print "  |   | \n";
        print "      | \n";
        print "      | \n";
        print "      | \n";
        print "      | \n";
        print " ========= \n";
    }
    elsif ( $misses == 1 ) {
        print "  +---+ \n";
        print "  |   | \n";
        print "  O   | \n";
        print "      | \n";
        print "      | \n";
        print "      | \n";
        print " ========= \n";
    }
    elsif ( $misses == 2 ) {
        print "  +---+ \n";
        print "  |   | \n";
        print "  O   | \n";
        print "  |   | \n";
        print "      | \n";
        print "      | \n";
        print " ========= \n";
    }
    elsif ( $misses == 3 ) {
        print "  +---+ \n";
        print "  |   | \n";
        print "  O   | \n";
        print " \\|   | \n";
        print "      | \n";
        print "      | \n";
        print " ========= \n";
    }
    elsif ( $misses == 4 ) {
        print "  +---+ \n";
        print "  |   | \n";
        print "  O   | \n";
        print " \\|/  | \n";
        print "      | \n";
        print "      | \n";
        print " ========= \n";
    }
    elsif ( $misses == 5 ) {
        print "  +---+ \n";
        print "  |   | \n";
        print "  O   | \n";
        print " \\|/  | \n";
        print "  |   | \n";
        print "      | \n";
        print " ========= \n";
    }
    elsif ( $misses == 6 ) {
        print "  +---+ \n";
        print "  |   | \n";
        print "  O   | \n";
        print " \\|/  | \n";
        print "  |   | \n";
        print " /    | \n";
        print "      | \n";
        print " ========= \n";

    }
    elsif ( $misses == 7 ) {
        print "  +---+ \n";
        print "  |   | \n";
        print "  O   | \n";
        print " \\|/  | \n";
        print "  |   | \n";
        print " / \\  | \n";
        print "      | \n";
        print " ========= \n";
        print "The codeword was: "
          . $codeword . "\n"
          ; #printing the word as it was guessed by the user in given number of chances
        print "Ooops !! you lost try again!!!\n";   #printing the losing message
        exit 0;
    }
}