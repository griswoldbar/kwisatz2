class Email
  @@delivered = 0
  
  def archive
    
  end
  
  def deliver(name, email)
    @@delivered += 1
    archive
  end
  
  def self.delivered
    @@delivered
  end
end


class User
  attr_accessor :name
  attr_accessor :email
  
  def initialize(name, email)
    @name   = name
    @email  = email
    @mailer = Email.new
  end
  
  def register
    @mailer.deliver(name, email)
    puts "Welcome to ...."
  end
end


# =========

describe "Email" do
  describe ".delivered" do
    it "has no delivered emails by default" do
      Email.delivered.should == 0
    end
    
    it "returns the number of emails delivered" do
      Email.class_variable_set(:@@delivered, 4)
      Email.delivered.should == 4
    end
  end
  
  describe ".deliver" do
    it "increments the delivered count" do
      expect { Email.deliver("name", "email") }.to change { Email.delivered }.by(1)
    end
  end
end

describe "User" do
  let(:mailer)  { mock("mailer").as_null_object }
  let(:user)    { user = User.new("Fred", "fred@astaire.com") }

  before(:each) do
    user.instance_variable_set(:@mailer, mailer)
  end

  
  it "can be initialised with a name and an email" do
    user.name.should == "Fred"
    user.email.should == "fred@astaire.com"
  end
  
  describe "#register" do
    it "welcomes the user" do
      user.stub(:puts).with("Welcome to ....")
      user.register
    end
    
    it "delivers a confirmation email" do
      user.stub(:puts)
      mailer.should_receive(:deliver)
      user.register
    end
  end
end






