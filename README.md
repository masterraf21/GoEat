# GoEat

GoEat is a simple CLI based app that has the features like the Go-Food app in Go-Jek. So it is basically
a simplified Go-Food app made in ruby. 

## Program Features

There are still a lot of features not implemented in this program. The current state
of the program is that the program has not been able to run its main feature yet. 

When running the program without any argument you will se a cli working
showing the main menu for the program. At that point the program has generated 
the default data required with the program which is: a map, a user, 5 drivers, 3 stores.
But if you step more than that the program can not proceed to the required menu.

The program now only capable of running without any argument (i tried using thor but it is so hard to implement :( 
)

The program is far from finished (obviously speaking) but able to run its cli module and generate
objects in the background. I tried so hard to finish the program in time but i had just understand the 
ruby-oop concept earlier this week. But really the experience of learning is priceless. So thank you so much
for COMPFEST for giving me the opportunity to learn something new :).

Missing features
1. Argument parsing
2. Map showing functionality
3. Position locating functionality (including selecting the nearest driver from a store)
4. Travel functionality 
5. History showing (the method has been implemented but the CLI hasn't been able to show it anyway)
6. Reading from a file

A lot of the features above already has method name inside their own respected file.


## Program Design
The overall design of the program follows oop paradigm and SOLID Principle especially the S.R.P one. 
The directory structure of the program follows the ruby gem configuration. The program is divided into 
18 classes. Following the single responsibily principle, each class has their own purpose.

For basic class Constructor  we have :
1. Driver
2. Store
3. User 

These classes are the building blocks of this program. They all have methods inside
their classes to perform task that will be used later in certain tasks.

Next we have object-containing-class :
1. DriverBook
2. StoreBook

These classes have only a single purpose: containing objects created so they will
be accessed easily later. They are basically array with a different names.

For driver utility purpose we have :
1. DriverUtil

This class have methods to accomodate operation that involves driver such as checking
if one has rating below 3.0 (not implemented).

For map-related stuff we have:
1. Map
2. Travel
3. Position
4. Randomize

All classes above have methods to operate coordinate stuff, map generating stuff, travel from
one point to another stuff.

For order-related stuff we have:
1. Create_Order
2. Order
3. History
4. HistoryBook
5. Pricing

Create_Order are the driver method for order-creating menu, while the Order class is used
to store an order object consisting of order stuff. History Class deals with running method for 
showing orders, while HistoryBook is the same as DriverBook and StoreBook. The pricing class is deals
with pricing related with Travel Class.

For data writing stuff we have:
1. DataWriting (not implemented)

DataWriting class originally will be used to handle file reading and file writing operation but has not 
been implemented yet. 

For CLI we have:
1. CLI
2. Running

Those 2 classes are the main interface for CLI operation the program will show. 
Originally the CLI will handle 3 different input stuff but apparently not. So the CLI only has methods that 
deal with running the file without any argument. The Running method is just
the extension of the CLI class. The running class responsible for making the 
objects for the operation.

That's all the CLASS used for the program. The design for the program itself have been
explained subtly above.

 
## Installation

To use this app first you must install all the dependency coming with this app. SImply run this command on 
the main GoEat directory:

    $ bundle install

## Usage

You can run these app with 3 arguments. Simply run this commands on the /exe directory:
1. With no argument
   
   `ruby GoEat`

2. With 3 arguments. The first one is the size of the map 'n', and the next two are the
coordinate of the user, 'x', and 'y' 
**(this feature is not yet implemented)**
    
    `ruby GoEat -t n x y`

3. With a filename **(this feature is not yet implemented)**

    `ruby GoEat -f data.txt`
        