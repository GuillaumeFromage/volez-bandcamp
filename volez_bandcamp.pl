#!/usr/bin/perl

use File::Temp;
use Data::Dumper;
use JSON;
use Getopt::Long;
$tempdir = File::Temp->newdir();

my $notidy = '';	# option variable with default value (false)
my $verbose = '';
my $url = '';

sub usage() {
    print <<EOF
Usage: $0 [ --verbose ] [ --notidy ] --url http://example.bandcamp.com

SUPPORT THE FUCKING BANDS YOU TOOLS !

Its a fucking sham that they used bandcamp that
doesn't have support for html5 player (how hard
can that be ?), and its a sham I spend a day to
get music from my friends, but fuck, its just 
that bandcamp is shit, not that the musicians
are bad.
EOF
;
}

GetOptions ('notidy' => \$notidy, 'verbose' => \$verbose, 'url=s' => \$url)
  or usage();

if(!$url) {
    usage();
    print("Please give an bandcamp album url!");
    exit(1);
}

# FIXME: this should be an argument 
system("wget " . $url . " -O " . $tempdir . "/index.html");

# we just get use some really easy to spot (for grep :D) lines
# and we are taking just that part of the file where the array
# that contains all the data gets declared
$working_with = `A=\$((\$(grep -n "if ( window.FacebookData ) {" $tempdir/index.html | cut -d ":" -f 1)-5)) ; B=\$((\$(grep -n "var TralbumData" $tempdir/index.html | cut -d ":" -f 1)+3)) ; head -n \$A $tempdir/index.html | tail -n \$((\$A-\$B))`;

# with my eagle eye, I saw that it was almost JSON, and we 
# just need to regex it a couple of time to get valid JSON,
# with vim I've just did:
# the fucking asdf: "fu" => "asdf": "fu"
$working_with =~ s/^(\s*)([-_a-zA-Z0-9]+)(\s*):/$1"$2"$3:/mg; 
# odd escaping
$working_with =~ s/\\"/\\\\\\"/mg;
$working_with =~ s/\\r/\\\\r/mg;
$working_with =~ s/\\n/\\\\n/mg;
# odd javascript construct in there 
$working_with =~ s/" \+ "//mg;  
# oh, and it needs to be in brackets
$working_with = '{' . $working_with . '}';

my @perl = from_json($working_with);

if($verbose) {
    print Dumper(@perl); 
}

# this isn't "shell safe" as they can contain ' and shit,
# therefore we're using system(@args), if you're doing
# anything escape those chars!
my $album_title = $perl[0]{'current'}{'title'};
# But you can't have a backslash in a filename:
# http://stackoverflow.com/questions/9847288/is-it-possible-to-use-in-a-filename
$album_title =~ s/\//-/g; 
my $band_name = $perl[0]{'artist'};
$band_name =~ s/\//-/g; 

$dir = "$tempdir/$band_name - $album_title";

#FIXME fail gracefully if not able to create directory
mkdir $dir;

#print Dumper($perl[0]{'trackinfo'}[0]);
foreach $track (@{$perl[0]{'trackinfo'}}) {
   $title = @{$track}{'title'};
   $title =~ s/\//-/g; 
   $track_num = @{$track}{'track_num'};
   print("wget '" . @{@{$track}{'file'}}{'mp3-128'} . "' -O \"" . $dir . "/" . "$track_num - $title.mp3" . "\"\n");
   # just in case they run fail to ban, we should wait 30sec
   # however, the files 302 to some other path, so fuck this
   # shit, we have to wait for _seconds _between downloads. 
   my $url = @{@{$track}{'file'}}{'mp3-128'};
   @args = ("wget", 'https:' . @{@{$track}{'file'}}{'mp3-128'}, "-O", $dir . "/" . "$track_num - $title.mp3");  
   system(@args);
   # sometimes its okay, sometime its not, it must depend on
   # what they're provided by the band
   @args = ('id3v2', '-a', $band_name, '-t', $title, '-A', $album_title, '-T', $track_num, "$dir/$track_num - $title.mp3");
   system(@args);
}

# we get the album art
#FIXME the file isn't necessarily .jpg
@args = ("wget", $perl[0]{'artFullsizeUrl'}, "-O", $dir . "/" . "Folder.jpg");

print("wget " . $perl[0]{'artFullsizeUrl'} . " -O \"" . $dir . "/" . "Folder.jpg" . "\"\n");
system(@args);

# FIXME we should be able to dump this anywhere
@args = ("mv", $dir, ".");
system(@args);

if (!$notidy) {
  print "here";
 # rmdir $tmpdir
}
