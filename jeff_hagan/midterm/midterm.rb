### I can't take credit for the "Cat Facts" concept - check it out on Reddit: http://www.reddit.com/r/funny/comments/owx3v/so_my_little_cousin_posted_on_fb_that_he_was

# Next 3 lines only for Jeff's computer:
#require 'open-uri'
#require 'openssl'
#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

require 'twilio-ruby'

class CatFacts

  def welcome
    puts "Welcome to Cat Facts! Enter your phone number to receive a Cat Fact!"
    @your_number = gets.strip.to_i
    catfact
  end

  def catfact
 #Source of @cat_facts: http://www.buzzfeed.com/chelseamarshall/meows#27nfeyq
    @cat_facts = ["A group of cats is called a clowder.", "Cats are often lactose intolerant, so stop givin’ them milk!", "The first cat in space was French. She was named Felicette, or “Astrocat.” She survived the trip.", "Cats can move their ears 180 degrees.", "When your cat brings home a dead mouse or bird, it may do so to show you that you suck at hunting.", "A cat has been mayor of Talkeetna, Alaska, for 15 years. His name is Stubbs."]
    @random_cat_fact = @cat_facts[rand(0..5)]

    @account_sid = 'AC136544a879034f812c2e9061ae96bca9'
    @auth_token = 'fee801e87f54981785ebc509adf3c548'

    @client = Twilio::REST::Client.new @account_sid, @auth_token

    @client.account.messages.create(
    from: '7324106542', 
    to: "#{@your_number}", 
    body: "#{@random_cat_fact}",
    )
  end
end

test = CatFacts.new
test.welcome