# Rocket Elevators Information System

<h2>Week 7 - APIs</h2>

## Members of this week's team
- **[Jorge Marcoux](https://github.com/jorgemarcoux)**
- **[Samuel Coutinho](https://github.com/samuel-coutinho)**
- **[Olivier Beachesne](https://github.com/overview76)**
- **[William Sinclair](https://github.com/WilliamSinclairF)**

<p>
This week we learned to use the excellent service APIs that will give our client's system new capabilities. The APIs we use are:</p>
<ol>
	<li><b>Google Maps</b> for geolocalisation</li>
	<li><b>Twilio</b> to send SMS updates when certain events occur</li>
	<li><b>Slack</b> to send updates to the Slack elevator maintenance channel</li>
	<li><b>Dropbox</b> to store files in the cloud</li>
	<li><b>Sendgrid</b> to send emails to our leads</li>
	<li><b>IBM Watson</b> to create a customized welcome message</li>
	<li><b>ZendDesk</b> to create tickets for our sales department and customer service when new quotes are created as well as when a contact form is sent</li>
</ol>

<h4>Gems used:</h4>
<ol>
	<li>Excon</li>
	<li>Figaro</li>
	<li>Dropbox_api</li>
	<li>Geocoder</li>
	<li>Ibm_watson</li>
	<li>New_google_recaptcha</li>
	<li>Twilio-ruby</li>
	<li>Sendgrid-ruby</li>
  <li>Slack-notifier</li>
</ol>

Our website deployed on CodeBoxx servers can be found at http://marcouxs.com/ . In order to visit the "backoffice" section, you will need to login with the following information: 

- username: admin@admin.com 
- password: admin123

## How to try out the integrations:

### Google Maps

Log in using the aforementioned admin account and while in the backoffice, click on the Customer Maps link under "Data Visualization" on the lefthand panel and you will be redirected to a map of all the buildings that are currently serviced by Rocket Elevators. You can get detailed information about each building by clicking on a cluster then clicking on one of the markers.

### Twilio

When the status of an elevator is set to "Intervention", the technical contact assigned to the building associated with the elevator will receive an SMS.

### Slack
While in the admin dashboard, click on "Elevators" on the lefthand panel. you'll see the Slack API in action by changing the status of an elevator.


### Dropbox

The Dropbox API takes files that are uploaded via the contact form and when the contact that filled the form becomes a customer, the previously uploaded attachment will be sent to Dropbox for safekeeping.

### Sendgrid

After customers fill out the contact form, the Sendgrid API will reach out to them via email to greet them and assure them that a representative will contact them shortly.

### IBM Watson

Once again in the backoffice section of the website, a function will trigger every time an admin logs in. This function calls the IBM Watson API and receives a text to speech audio file that goes over key metrics of the company. This file can be played via the audio player embedded in the dashboard.

### Zendesk

When a customer sends a contact form or a quote, the Zendesk API is triggered and a new ticket is created on the behalf of the customer. This ticket contains the customer's contact information and provides an easy way for the Rocket Elevators support team to respond to customers and follow up on requests.


## Main languages used to build the project

- [Rails](https://guides.rubyonrails.org/)

- [HTML5](https://www.w3schools.com/html/)

- [RUBY](https://www.ruby-lang.org/)

- [JavaScript](https://www.javascript.com/)

- [CSS](https://css-tricks.com/)

## More info
For a more in-depth look at how to set up the project in your own local environment, please head to:

https://github.com/WilliamSinclairF/Rocket_Elevators_Information_System/blob/master/README.md