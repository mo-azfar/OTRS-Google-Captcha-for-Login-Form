# OTRS-Google-Captcha-for-Login-Form  
- For OTRS CE v6.0  
- Google reCaptcha at OTRS customer portal (login form)		
- Modification files (based on OTRS 6.0.19) has been tag with :  

	#begin recaptcha  
	CODE  
	#end recaptcha  
	

1. create and configure captcha V2 https://www.google.com/recaptcha/admin  
2. Install Captcha::reCAPTCHA::V2 via cpan 
3. Enabled Captcha module at Admin > System Configuration > GoogleCaptcha::CustomerPortalLoginEnabled  
4. Update Site Key at Admin > System Configuration > GoogleCaptcha::SiteKey  
5. Update Secret Key at Admin > System Configuration > GoogleCaptcha::SecretKey  
6. Manually update $OTRS_HOME/var/httpd/htdocs/skins/Customer/default/css/Core.Login.css  

	Increase height for example 400px for #Slider and #PreLogin. Play around with the css to suit your need.
		

Simulation: Login without completing captcha    
[![Capture.png](https://i.postimg.cc/s2pZG42N/Capture.png)](https://postimg.cc/bGwvKbkx) 

[![Capture2.png](https://i.postimg.cc/DwcS2yp9/Capture2.png)](https://postimg.cc/hXfDsgBs)

Credit: Emin from otterhub for pointing out the culprit :P   
