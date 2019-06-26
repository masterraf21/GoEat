# GoEat

GoEat is a simple CLI based app that has the features like the Go-Food app in Go-Jek. So it is basically
a simplified Go-Food app made in ruby. 

## Program Features

## Program Design

## Installation

To use this app first you must install all the dependency coming with this app. SImply run this command on 
the main GoEat directory:

    $ bundle install

## Usage

You can run this app with 3 arguments. Simply run this commands on the /exe directory:
1. With no argument
   
   `ruby GoEat -n`

2. With 3 arguments. The first one is the size of the map 'n', and the next two are the
coordinate of the user, 'x', and 'y'
    
    `ruby GoEat -t n x y`

3. With a filename (this feature is not yet implemented)

    `ruby GoEat -f data.txt`
        