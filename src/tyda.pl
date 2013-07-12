#!/usr/bin/env perl

use strict;
use warnings;

##########################
### Start Main Program ###
##########################

# Forward declarations
sub usage();
sub checkDependancies();
sub forgeCurlCmd($);

# Verify the number of arguments
if ($#ARGV != 0) { 
  usage();
  exit(1);
}

checkDependancies();

my $searchTerm = qq("$ARGV[0]");
my $curlCmd    = forgeCurlCmd($searchTerm);

my @interestingLines = `$curlCmd | grep tyda_assoc_word`;

# Extract words
my @translations = ();
foreach my $line (@interestingLines) {
  if (my @matches = $line =~ /tyda_assoc_word\">(.+?)<\//g) {
    push(@translations, @matches);
  }
}

# Remove words that occur more than once
my @uniqeTranslations = ();
foreach my $translation (@translations) {
  if (!grep(/^$translation$/, @uniqeTranslations)) {
    push(@uniqeTranslations, $translation);
  }
}

# Print all translations
foreach my $translation (@uniqeTranslations) {
  print $translation . "\n";
}

exit(0);

########################
### End Main Program ###
########################

# Put toghether the curl command
sub forgeCurlCmd($) {
  my $searchTerm = shift;

  my $curlCmd;
  $curlCmd = "curl -G -s"; 
  $curlCmd = $curlCmd . " --data-urlencode w=$searchTerm";
  $curlCmd = $curlCmd . " -d form=1";
  $curlCmd = $curlCmd . " -d w_lang=";
  $curlCmd = $curlCmd . " -d action=submit";
  $curlCmd = $curlCmd . " -d form_search=1";
  $curlCmd = $curlCmd . " -d source_langs=en";
  $curlCmd = $curlCmd . " http://tyda.se/search";
  return $curlCmd;
}

sub checkDependancies() {
  my $retval = system("which grep > /dev/null");
  if ($retval) {
    print("Error: grep has to be installed!\n");
    exit(1);
  }

  $retval = system("which curl > /dev/null");
  if ($retval) {
    print("Error: curl has to be installed!\n");
    exit(1);
  }
}

sub usage() {
  print "Usage: tyda word\n";
}
