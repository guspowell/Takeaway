Takeaway Challenge
=======================

Our second Makers Academy weekend challenge involved using the Twilio gem to send an automated text message when the user orders from a takeaway restaurant.

## Brief
- Placing the order by giving the list of dishes, their quantities and a number that should be the exact total.
- If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
- The text sending functionality should be implemented using Twilio API.
- Use twilio-ruby gem to access the API
- Use a Gemfile to manage your gems
- Make sure that your Takeaway is thoroughly tested

## Technologies Used

- Ruby
- Rspec
- Twilio

## Installation Instructions

Clone the repository:
~~~
git clone git@github.com:guspowell/Takeaway.git
cd Takeaway
~~~
Install the gems:
~~~
bundle install
~~~


## Favourite Code Snippet

~~~ruby
def send_text
  @time = Time.new
  message = @client.account.messages.create(:body => text,
                                            :to => "+447887886622",
                                            :from => "+441663362053")
end
~~~
