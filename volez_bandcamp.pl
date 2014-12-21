#!/usr/bin/perl

use File::Temp;
use Data::Dumper;
use JSON;

my $json = << "END_OF_TEST_ALBUM";
{     "current": {"purchase_title":null,"about":"\\\"Go To Prison\\\" was recorded in April 2014, in a hotel room. Engineered and Mixed by James Whitten, Mastered by Mike Hogan. All songs written and performed by PEARS, except Track 8, which was written by some dude in a leather jacket.","require_email_0":null,"download_pref":2,"publish_date":"23 Jun 2014 18:31:25 GMT","featured_track_id":3600097777,"credits":"Zach Quinn - Vocals\\r\\nBrian Pretus - Guitar/Vocals\\r\\nAlex Talbot - Bass\\r\\nJohn Bourgeois - Drums\\r\\n\\r\\nGang vocals by: James Whitten, Michael Moises, Kanye West, Greg Ginn In a Fish Costume, Some angry skateboard guy, and PEARS.","auto_repriced":null,"set_price":7.0,"killed":null,"mod_date":"08 Aug 2014 23:58:46 GMT","new_desc_format":1,"art_id":252188662,"private":null,"title":"Go To Prison","id":4118022436,"upc":"888295114950","release_date":"24 Jun 2014 00:00:00 GMT","download_desc_id":null,"minimum_price_nonzero":7.0,"artist":null,"is_set_price":null,"type":"album","purchase_url":null,"require_email":null,"new_date":"23 Jun 2014 14:43:05 GMT","band_id":1828663984,"minimum_price":7.0},
    "is_preorder": null,
    "album_is_preorder": null,
    "album_release_date": "24 Jun 2014 00:00:00 GMT",
    "preorder_count": null,
    "hasAudio": true,
    "artThumbURL": "http://f1.bcbits.com/img/a0252188662_3.jpg",
	"artFullsizeUrl": "http://f1.bcbits.com/img/a0252188662_10.jpg",
    "trackinfo" : [{"video_source_type":null,"track_num":1,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":2808031573,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":53.9869,"title_link":"/track/youre-boring","title":"You're Boring","download_tooltip":"name your price high quality formats","id":3600097777,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":670,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=a4df694b043293a5fadfed7656f635c6&id=3600097777&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false},{"video_source_type":null,"track_num":2,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":3781458859,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":176.44,"title_link":"/track/victim-to-be-2","title":"Victim To Be","download_tooltip":"name your price high quality formats","id":775469368,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":691,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=cf6a0a82e98f6ba72e76b0616a13c77d&id=775469368&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false},{"video_source_type":null,"track_num":3,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":1745136930,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":88.4136,"title_link":"/track/breakfast","title":"Breakfast","download_tooltip":"name your price high quality formats","id":1314152282,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":728,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=01a0c2637739dfa36558aece7a66081d&id=1314152282&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false},{"video_source_type":null,"track_num":4,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":4106403429,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":106.827,"title_link":"/track/sycophant","title":"Sycophant","download_tooltip":"name your price high quality formats","id":3730163923,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":548,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=a2f10a8279d7989df49df6b511b7416c&id=3730163923&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false},{"video_source_type":null,"track_num":5,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":2292085271,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":121.054,"title_link":"/track/forever-sad-2","title":"Forever Sad","download_tooltip":"name your price high quality formats","id":700130700,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":1321,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=cecf3b3e85ee1ed2544586d19777c8a0&id=700130700&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false},{"video_source_type":null,"track_num":6,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":4229989180,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":125.054,"title_link":"/track/framework","title":"Framework","download_tooltip":"name your price high quality formats","id":3751916119,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":943,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=1157d4565a7229852aae2ebfaa6f4c75&id=3751916119&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false},{"video_source_type":null,"track_num":7,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":1480406963,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":93.7336,"title_link":"/track/terrible-2","title":"Terrible","download_tooltip":"name your price high quality formats","id":296641850,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":954,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=aff692e24279cd0d060c582fac8e9101&id=296641850&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false},{"video_source_type":null,"track_num":8,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":670215748,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":89.5736,"title_link":"/track/judy-is-a-punk","title":"Judy Is A Punk","download_tooltip":"name your price high quality formats","id":2723805070,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":138,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=6671710a14b232f89cf8edd04dbca4a1&id=2723805070&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false},{"video_source_type":null,"track_num":9,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":1794313233,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":129.227,"title_link":"/track/little-bags","title":"Little Bags","download_tooltip":"name your price high quality formats","id":359458379,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":891,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=7e502b21d297ca6745adac9d8171b912&id=359458379&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false},{"video_source_type":null,"track_num":10,"alt_link":null,"is_downloadable":true,"video_source_id":null,"lyrics":null,"album_preorder":false,"encodings_id":970583635,"encoding_error":null,"has_free_download":null,"video_mobile_url":null,"streaming":1,"unreleased_track":false,"encoding_pending":null,"video_id":null,"free_album_download":false,"private":null,"video_poster_url":null,"duration":296.76,"title_link":"/track/grimespree","title":"Grimespree","download_tooltip":"name your price high quality formats","id":158460592,"video_caption":null,"has_lyrics":true,"sizeof_lyrics":920,"license_type":1,"file":{"mp3-128":"http://popplers5.bandcamp.com/download/track?enc=mp3-128&fsig=6366faca66317c096a98d65891c9ca0c&id=158460592&stream=1&ts=1418781773.0"},"video_featured":null,"is_draft":false,"has_info":false}],
    "playing_from" : "album page",
    "featured_track_id" : 3600097777,
	"initial_track_num" : null,
    "packages": null,
    "url": "http://pearstheband.bandcamp.com/album/go-to-prison",
    "defaultPrice": 7.0,
    "freeDownloadPage": null,
    "maxPrice": 1000.0,
    "minPrice": 1.0,
    "FREE": 1,
    "PAID": 2,
    "artist": "PEARS",
    "item_type": "album",
    "id": 4118022436,
    "last_subscription_item": null}
END_OF_TEST_ALBUM

# we just get use some really easy to spot (for grep :D) lines
# and we are taking just that part of the file where the array
# that contains all the data gets declared
$working_with = `A=\$((\$(grep -n "if ( window.FacebookData ) {" index.html | cut -d ":" -f 1)-5)) ; B=\$((\$(grep -n "var TralbumData" index.html | cut -d ":" -f 1)+3)) ; head -n \$A index.html | tail -n \$((\$A-\$B))`;

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

print Dumper(@perl); 

exit(0);

$tempdir = 'farts'; # File::Temp->newdir();
#FIXME the file isn't necessarily .jpg

my @perl = from_json($json);
print $name;
my $album_title = $perl[0]{'current'}{'title'};
my $band_name = $perl[0]{'artist'};
$dir = "$tempdir/$band_name - $album_title";
#FIXME fail gracefully if not able to create directory
mkdir $dir;
#print Dumper($perl[0]{'trackinfo'}[0]);
foreach $track (@{$perl[0]{'trackinfo'}}) {
   $title = @{$track}{'title'};
   $track_num = @{$track}{'track_num'};
   print("wget " . @{@{$track}{'file'}}{'mp3-128'} . " -O " . $dir . "/" . "$track_num - $title" . "\n");
#   exec("wget " . @{@{$track}{'file'}}{'mp3-128'} . " -O " . $dir . "/" . "$track_num - $title");

}

print("wget " . $perl[0]{'artFullsizeUrl'} . " -O " . $dir . "/" . "Folder.jpg" . "\n");
#exec("wget " . $perl[0]{'artFullsizeUrl'} . " -O " . $dir . "/" . "Folder.jpg");

print $dir;
