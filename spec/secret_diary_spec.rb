require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do
  context "when locked" do
    it "refuses to be read" do
      diary = SecretDiary.new("diary")
      expect(diary.read).to eq "Go away!"
    end

    it "refuses to be written" do
      secretdiary = SecretDiary.new("diary")
      expect(secretdiary.write("new_message")).to eq "Go away!"
    end
  end

  context "when unlocked" do
    it "gets read" do
      diary = double :diary
      secretdiary = SecretDiary.new(diary)
      secretdiary.unlock
      allow(diary).to receive(:read).and_return("Hello")
      expect(secretdiary.read).to eq ("Hello")
    end

    it "gets written" do
      diary = double :diary
      secretdiary = SecretDiary.new(diary)
      secretdiary.unlock
      allow(diary).to receive(:write).with("Hello")
      expect(secretdiary.write("Hello")).to eq nil
    end
  end
end
