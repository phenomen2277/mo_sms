# MoSms

A Ruby wrapper class for the SMS sending service API called MO-SMS located in Sweden.
In order to use the service, you have to register an account. More information can be found on their [site](http://www.mosms.com).
The development of this gem has been done using MO-SMS's API specification found [here](https://www.mosms.com/se/docs/api_spec.pdf)

## Installation

Add this line to your application's Gemfile:

    gem 'mo_sms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mo_sms

## Usage

To fire the class just

    sms = MoSms::SMSSender.new("your_username", "your_password")

To send a text sms, call the .send() method. **Watch out for the Exceptions that can be thrown here :)**

+ The first argument is the phone number to send the SMS to
+ The second one is the type of the message (Can be either :text or :wap)
+ The third argument is the content of the message

```
sms.send("072123123", :text, "This is my message")
```

Other attributes are added to the class (read the API specification) like...

    sms.tariff = false #or true
    sms.allow_long_message = false #or true
    sms.custom_sender = false #or true

