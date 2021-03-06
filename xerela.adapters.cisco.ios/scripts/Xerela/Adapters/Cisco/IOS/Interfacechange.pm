package Xerela::Adapters::Cisco::IOS::Interfacechange;

use strict;
use warnings;

use Xerela::Adapters::Cisco::IOS::AutoLogin;
use Xerela::Adapters::Cisco::IOS::Disconnect qw(disconnect);
use Xerela::CLIProtocolFactory;
use Xerela::Logger;
use Xerela::Typer;

my $LOGGER = Xerela::Logger::get_logger();

sub invoke
{
	my $pkg = shift;
	my $doc = shift;

	# Initial connection
	my ( $connectionPath, $interfaces ) = Xerela::Typer::translate_document( $doc, 'connectionPath' );
	my $interfacesHash = $interfaces->{interface};
	my $cliProtocol    = Xerela::CLIProtocolFactory::create($connectionPath);
	my $promptRegex    = Xerela::Adapters::Cisco::IOS::AutoLogin::execute( $cliProtocol, $connectionPath );
	$cliProtocol->send_and_wait_for( 'terminal length 0', $promptRegex );
	my $configPrompt = '#\s*$';
	my $response     = $cliProtocol->send_and_wait_for( 'config term', $configPrompt );

	for my $intName ( sort keys %$interfacesHash )
	{
		$response .= $cliProtocol->send_and_wait_for( 'interface ' . $intName, $configPrompt );
		my $statusCommand = ( $interfacesHash->{$intName}->{setStatusTo} =~ /DOWN/i ) ? 'shutdown' : 'no shut';
		$response .= $cliProtocol->send_and_wait_for( $statusCommand, $configPrompt );
	}

	$response .= $cliProtocol->send_and_wait_for( 'end',       $promptRegex );
	$response .= $cliProtocol->send_and_wait_for( 'write mem', $promptRegex );
	disconnect($cliProtocol);
	return $response;
}

1;
