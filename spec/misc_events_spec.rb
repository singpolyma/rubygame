
# Prefer local library over installed version.
$:.unshift( File.join( File.dirname(__FILE__), "..", "lib" ) )
$:.unshift( File.join( File.dirname(__FILE__), "..", "ext", "rubygame" ) )

require 'rubygame'
include Rubygame::Events




describe "a simple event", :shared => true do
  
  it "should take zero arguments at creation" do
    lambda { @class.new }.should_not raise_error
    lambda { @class.new(:foo) }.should raise_error
  end

end



describe InputFocusGained do
  before :each do
    @class = InputFocusGained
  end

  it_should_behave_like "a simple event"
end

describe InputFocusLost do
  before :each do
    @class = InputFocusLost
  end

  it_should_behave_like "a simple event"
end



describe MouseFocusGained do
  before :each do
    @class = MouseFocusGained
  end

  it_should_behave_like "a simple event"
end

describe MouseFocusLost do
  before :each do
    @class = MouseFocusLost
  end

  it_should_behave_like "a simple event"
end



describe WindowMinimized do
  before :each do
    @class = WindowMinimized
  end

  it_should_behave_like "a simple event"
end

describe WindowUnminimized do
  before :each do
    @class = WindowUnminimized
  end

  it_should_behave_like "a simple event"
end



describe WindowExposed do
  before :each do
    @class = WindowExposed
  end

  it_should_behave_like "a simple event"
end



describe QuitRequested do
  before :each do
    @class = QuitRequested
  end

  it_should_behave_like "a simple event"
end




describe WindowResized do
  
  it "should have a size" do
    WindowResized.new([20,20]).should respond_to(:size)
  end

  it "should accept an [x,y] Array as size" do
    lambda { WindowResized.new([20,20]) }.should_not raise_error(ArgumentError)
  end

  it "should reject non-positive sizes"
  it "should reject invalid types as size"

  it "size should be read-only"
  it "size should be frozen"
  it "should not freeze the original Array passed as size"

end