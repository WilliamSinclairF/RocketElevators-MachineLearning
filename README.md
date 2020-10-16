# Rocket Elevators Information System

## Week-4, Team Project Description

The main goal of this week is to transform the static site previously developed during the Genesis program and turn it into a web application on MVC (Model - View - Controller) foundations. The site must be in a state that allows you to create a new section that saves the Javascript form that calculates an estimate in the form of a purchase order. This purchase order includes the key elements of the estimation form and allows you to enter more details.

## Members of the team

#### - [William Sinclair](https://github.com/WilliamSinclairF)
#### - [Frimina Zaddi](https://github.com/frimina)
#### - [Loïc Rico](https://github.com/ricoloic)

## GitHub Repository

https://github.com/WilliamSinclairF/Rocket_Elevators_Information_System


 ## Utils
 - [Rails](https://guides.rubyonrails.org/) <br>
 - [HTML5](https://www.w3schools.com/html/) <br>
 - [RUBY](https://www.ruby-lang.org/) <br>
 - [JavaScripts](https://www.javascript.com/) <br>
 - [CSS](https://css-tricks.com/) <br>
 
 - [Ubuntu](https://www.microsoft.com/en-ca/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab) <br>



    Terms : <br>
    Gemfile - A format for describing gem dependencies for Ruby programs
    Bundle - Ruby Dependency Management
    Migrations - Convenient way to alter your database schema over time in a consistent way.


 ## How to use

 1. Install Ruby on Rails

    Follow the instuctions for installing Ruby on Rails depending on your operatiing system  

    For Mac computer  : https://gorails.com/setup/osx/10.15-catalina <br>

    For Ubuntu computer  : https://gorails.com/setup/ubuntu/18.04 <br>

    For Windows computer  : https://gorails.com/setup/windows/10 <br>


    The main installations that you will need to do in order for the program to run well

    a) Installing Homebrew <br>
    b) Installing Ruby <br>
    c) Configuring Git <br>
    d) Installing Rails <br>
    c) Setting Up A Database <br>
    d) Installing and setting MySQL <br>
    e) Installing and setting PostgreSQL <br>


    If you have any problems during installation, google is your best friend. 

    Here is a list of forums that might help you : 

    a) https://stackoverflow.com/ <br>
    b) https://www.reddit.com/ <br>
    c) https://askubuntu.com/ <br>
    d) https://developer.mozilla.org/ <br>



2. Setting up databases

    When all the installation are done, you have to create a test application to validate that everything is set up correctly. 
    If all goes well, the installation should end by displaying : Yay! You're on Rails! 


    If so, you are now ready to run the program.
    Do not forget to visit the Rails official website if you want to understand some aspects of the program.


    When you download the program, make sure that the file config/database.yml
    is set correctly. If it's isn't the case. The program might show you some error when you lunch the server.
    Use this command to install the dependencies specified in your Gemfile :

        bundle-install 

    Some bundler command that can be useful : https://bundler.io/bundle_install.html or 
    https://stackoverflow.com/questions/7304576/how-do-i-set-up-the-database-yml-file-in-rails

    If you have error with the bundler, this link can help you : https://help.dreamhost.com/hc/en-us/articles/115001070131-Using-Bundler-to-install-Ruby-gems

    Command to find some gem : https://guides.rubygems.org/rubygems-basics/


    Sometimes you have to run this command in ordre to reset your database

        rails db:reset <br>
        rails db:drop <br>
        rails db:create <br>
        rails db:migrate <br>



3. Running the program

    Enter in the file of the program with : <br>
        cd file_name

    Make sure the all the migration are done with (rails db:migrate). <br>
        rails db:migrate

    Run the server with :  <br>
        rails server



4. Exploring the Rocket Elevator Website


    The main program of our website is on the quotes page. 
    From this page, you can get a quote for the type of building you are looking for. We have three types of elevator to satisfy everyone. 


    To do this, you must log in using the sign in button. 
    After that, the information that you send to the software will enter a database. This data will allow us to give you the best service according to your needs.


    Know that all your modifications as well as all your quotes are carefully saved and you can access them by going to your account.

5. Acesss to our code 


    Here is the most important folder and files that makes sure our program runs well : 

    app/views : 
        Most of our different html codes that make up our website. The files are a combination of HTML and Ruby
    
    db
        All the database related files go inside this folder. The configuration, schema, and migration files can be found here, along with any seed files.

    app/models : 
        This folder make sure the you find a particular data that you're looking for, update that data and remove data. 

    app/controllers : 
        This is where all the controller files go. Controllers are responsible for orchestrating the model and views.
 
    
    config/routes : 
        The rails router recognizes our different URLs and dispatches them to a controller's action


    config/database.yml :
        This file holds all the database configuration the application needs. many different configurations can be set for different environments.

    config/environment.rb
        This file requires application.rb to initialize the Rails application.


    Gemfile :
        The Gemfile is the place where all your app’s gem dependencies are declared.


    
    For more informations about the rails directory structure, please visit : https://www.sitepoint.com/a-quick-study-of-the-rails-directory-structure/


    

6. Our different database

For more control of the database, we suggest you to install mysql workbench. It works almost with all peratiing system 

Here is the link to download it : https://www.mysql.com/fr/products/workbench/

To download the program, you must make sure that you have an account with oracle. 
If it's not the case, here is the link to register : https://cutt.ly/Bgg9JBs

You can also add it in a code editor like visual studio code or IntelliJ IDEA. These different programs allow you to modify database tables more easily.



