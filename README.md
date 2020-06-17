# OTRS-Google-Captcha-for-Login-Form
- For OTRS CE v6.0
- Google reCaptcha at OTRS agent and customer portal (login form)		
- Modification files (based on OTRS 6.0.19) has been tag with :

	For Agent Portal  
	
			#begin agent recaptcha  
			CODE  
			#end agent recaptcha  
	
	For Customer Portal  
		
			#begin recaptcha  
			CODE  
			#end recaptcha  
	

			1. create and configure captcha V2 https://www.google.com/recaptcha/admin  
			2. Install Captcha::reCAPTCHA::V2 via cpan  
			3. Enabled Agent Captcha module at Admin > System Configuration > GoogleCaptcha::AgentPortalLoginEnabled  (For agent portal)  
			4. Enabled Customer Captcha module at Admin > System Configuration > GoogleCaptcha::CustomerPortalLoginEnabled  (For customer portal)  
			5. Update Site Key at Admin > System Configuration > GoogleCaptcha::SiteKey  
			6. Update Secret Key at Admin > System Configuration > GoogleCaptcha::SecretKey  
			7. Manually update $OTRS_HOME/var/httpd/htdocs/skins/Customer/default/css/Core.Login.css  (for customer portal captcha)  

			Increase height for example 400px for #Slider and #PreLogin. Play around with the css to suit your need.  
		

Simulation: Login without completing captcha    

Customer Portal:
[![Capture2.png](https://i.postimg.cc/DwcS2yp9/Capture2.png)](https://postimg.cc/hXfDsgBs)  

Agent Portal:  
[![agent.png](https://i.postimg.cc/9XZQb7rP/agent.png)](https://postimg.cc/yW6KYWhW)  