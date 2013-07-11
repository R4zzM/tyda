#!/usr/bin/env perl

use strict;
use warnings;

### Start Main Program ###

# Forward declarations
sub usage();
sub checkDependancies();

# Length of array -1
if ($#ARGV != 0) { 
  usage();
  exit(1);
}

checkDependancies();

my $httpRequest = "http://tyda.se/search?form=1&w=" . $ARGV[0] . "&w_lang=&form=1&action=submit&form_search=1&source_langs=en";

my @interestingLines = `curl -s \"$httpRequest\" | tidy -utf8 -f /dev/null | grep tyda_assoc_word`;

# Extract words
my @translations = ();
foreach my $line (@interestingLines) {
  if ($line =~ /.*tyda_assoc_word\">(.+?)<\/.+>/) {
    my $translation = $1;
    push(@translations, $translation) if $1;
  }
}

# Remove words that occur more than once
my @uniqeTranslations = ();
foreach my $translation (@translations) {
  if (!grep(/^$translation$/, @uniqeTranslations)) {
    push(@uniqeTranslations, $translation);
  }
}

# Print all the translations
foreach my $translation (@uniqeTranslations) {
  print $translation . "\n";
}

exit(0);

### End Main Program ###

sub checkDependancies() {
  my $retval = system("which curl > /dev/null");
  if ($retval) {
    print("Error: curl has to be installed!\n");
    exit(1);
  }

  $retval = system("which tidy > /dev/null");
  if ($retval) {
    print("Error: tidyhtml has to be installed!\n");
    exit(1);
  }
}

sub usage() {
  print "Usage: tyda word-to-be-translated-to-swedish-from-english\n";
}
