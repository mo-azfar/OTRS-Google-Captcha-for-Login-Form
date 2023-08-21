# --
# Copyright (C) 2023 mo-azfar,https://github.com/mo-azfar
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::FilterElementPost::ShowGoogleCaptcha;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Group',
    'Kernel::System::Web::Request',
);

use Kernel::System::VariableCheck qw(:all);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject                    = $Kernel::OM->Get('Kernel::Config');
    #my $ParamObject                     = $Kernel::OM->Get('Kernel::System::Web::Request');
	
	# --
	# Agent Google Captcha
	# --
	if ( $Param{TemplateFile} eq 'Login')
    {
		use Captcha::reCAPTCHA::V2;
        my $SiteKey = $ConfigObject->Get('GoogleCaptcha::SiteKey');		
        my $rc = Captcha::reCAPTCHA::V2->new;
		my $captchafield = $rc->html($SiteKey, { theme => 'dark' }, { size => 'compact' }, { type => 'image' });
		my $Field = qq~
		<div>$captchafield</div>
		~;
	            
		my $SearchField = quotemeta "<div class=\"Field\">
                                    <button type=\"submit\" id=\"LoginButton\" class=\"btn-main btn-primary\" value=\"Login\" disabled=\"disabled\"><span>Login</span></button>
                                </div>";
	
		my $ReturnField = qq~<div class="Field">
                                    <button type="submit" id="LoginButton" class="btn-main btn-primary" value="Login" disabled="disabled"><span>Login</span></button>
                                </div>
		~;
	
		#search and replace	 
		${ $Param{Data} } =~ s{$SearchField}{$Field $ReturnField};
		
    }  
	# --
	
	# --
	# Customer Google Captcha
	# --
	if ( $Param{TemplateFile} eq 'CustomerLogin')
    {
		use Captcha::reCAPTCHA::V2;
        my $SiteKey = $ConfigObject->Get('GoogleCaptcha::SiteKey');		
        my $rc = Captcha::reCAPTCHA::V2->new;
		my $captchafield = $rc->html($SiteKey, { theme => 'dark' }, { size => 'compact' }, { type => 'image' });
		my $Field = qq~
		<div>$captchafield</div>
		~;
	            
		my $SearchField = quotemeta "<div>
                    <button type=\"submit\" value=\"Log In\" class=\"btn-main btn-primary\" disabled=\"disabled\">Log In</button>
                </div>";
	
		my $ReturnField = qq~<div>
                    <button type="submit" value="Log In" class="btn-main btn-primary" disabled="disabled">Log In</button>
                </div>
		~;
	
		#search and replace	 
		${ $Param{Data} } =~ s{$SearchField}{$Field $ReturnField};
		
    }  
	# --
	
    return 1;
}

1;
