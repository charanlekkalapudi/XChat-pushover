use strict;
use warnings;
use Xchat;
use xchat qw( :all );
use LWP::UserAgent;

register("Pushover Script", "0.1", "Push Messages when screensaver on");

foreach('Channel Msg Hilight', 'Private Message', 'Private Message to dialogue') {
	hook_print($_, \&pushMessage)
}

sub pushMessage {
	LWP::UserAgent->new()->post(
		"https://api.pushover.net/1/messages.json", [
		"token" => "App Token",
		"user" => "User Token",
		"message" => $_[0][1],
	]);
}
