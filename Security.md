# CodeBoxx Bootcamp - Security: Vulnerability assessment


### Background
The purpose of this exercise is to document the highest priority vulnerabilities of this repository's code. The code found in this repository is the culmination of several weeks of work done both in teams and on my own. Since the bootcamp is now nearly finished, it's time to go back and identify 5 possible security flaws in the code and attempt to mitigate them as much as possible. This file will be used to keep track of what I'm able to find.

[The list was compiled with the help of this document](https://drive.google.com/file/d/12tYQuNTB2CbjwLUCCIBeK_HakBGRHONK/view)

## 1: Security Misconfiguration / Broken Access Control
Certain controller actions found in the application such as the main Application Controller found in `app/controllers/application_controller.rb ` have their authenticity token verifications turned off. This was done to allow us to log in on certain parts of the website where we would be getting TLS and SSL errors due to improperly configured settings on the server the app was hosted on. This is a high level threat as it opens the door to cross-site request forgery and in the real world, it could allow attackers to access sensitive data hosted on the app's server.

To address this vulnerability, the following steps could be taken:

 1. Ensure the web server used is properly configured for TLS/SSL and
    Cloudflare to resolve errors the errors the deployed website was
    experiencing.
    
 2. Remove all mentions of `skip_before_action 
    :verify_authenticity_token` that can be found in the code of multiple controllers and helper methods,

## 2: Injection
The website has multiple endpoints in controllers that are used to fetch data and return it in JSON. The endpoints are secured behind user authentication and permissions but a theoretical disgruntled employee could still attempt to attack the website through those faults, possibly leading to confidential data being leaked or simply destroyed. 

To ensure this doesn't happen, all endpoints that accept parameters could have additional logic added to them to verify what kind of data is being used. The controllers already only accept certain parameters but an experienced hacker might still find a way to get around that and run malicious SQL queries on the app's database.

The logic could ensure that for instance, only numbers are allowed and that the length of the query string is shorter than a certain amount of characters.

After doing a bit of testing, it seems like Rails is already doing some work to prevent this from happening but more security is always better than less, especially for a prestigious fake company like Rocket Elevators!

## 3:  Insufficient Logging & Monitoring

The app currently logs server related errors but there is little logging related to failed validations or repeated unauthorized requests. There's also no monitoring whatsoever. In the real world, this would be perfect for a hacker with a lot of spare time as they could simply keep picking at the app until they find something that works without any interruptions. The few logs the app does generate are hard to get to and are not easily queryable. 

To address this issue, we could implement a form of log streaming via FTP or other means. We could also use the monitoring services of the cloud hosting provider we are using or implement our own solution.

## 4: Using Components with Known Vulnerabilities
Ruby on Rails has a great ecosystem around it with a lot of packages in the form of "gems" that can be installed to quickly add new features. Unfortunately, every new gem installed adds possible vulnerabilities and it makes keeping the app secure incrementally more difficult. 

Some of the gems that were used in the project have not been maintained for a few years and the code they come with hasn't been reviewed by the developers. Sadly, some gems have also simply been maintained less over the years as Rails became less popular. This is not always a problem since some gems are only for styling purposes but it can become a problem when the gems handle security related functions. One such gem was used for Google reCAPTCHA ("new_google_recaptcha"). There's also "rails_admin" which is used for the entirety of the back office section of the website. There could be other risky gems that are simply part of the Rails version we used (5.2.4). 

To address this possible vulnerability, a complete assessment of the gems that were used would be wise. Additionally, we could also evaluate the known security flaws of Rails 5.2.4 and evaluate whether they would be fixed by updating to a newer version of the framework.

## 5: Sensitive Data Exposure
As mentioned in the first point of this report, the app and the server it's hosted on have some questionable TLS and SSL settings. This could open the door to attackers and if an employee were to access the website's backoffice on a public Wi-FI network, a malicious actor could intercept the request, hijack the employee's session and access Rocket Elevator's customer database or do great damage to it. 

To mitigate risk, it would be wise to stop using flexible SSL/TLS settings with Cloudflare and switch to full encryption. Point #1 will first have to be addressed in order to accomplish that. 

<hr>

### Conclusion
I'm sure there are other vulnerabilities in the app's code but I found these five to be the most pressing. I will strive to learn more about security and industry best practices to make the apps I create as secure as possible and I do my best to keep up with what's happening in the software development world to be proactive about new exploits.