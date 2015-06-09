require_relative '../../spec_helper'

RSpec.describe Languages::RubySyntax do

  before :each do
    @syntax = Languages::RubySyntax.new
  end

  context "Extern requirement detections." do

    it "Correct state transition (require_relative)." do
      path = "spec/samples/rubySyntaxParts/extern/requireRelative.rb"

      expect(@syntax.state)
          .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)

      @syntax.analyse_source(path)

      expect(@syntax.state)
          .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (require_relative)." do
      path = "spec/samples/rubySyntaxParts/extern/requireRelative.rb"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].extern_requirements[0].name).to eq ("one")
      expect(@syntax.fileElements[0].extern_requirements[1].name).to eq ("two")
      expect(@syntax.fileElements[0].extern_requirements[2].name)
        .to eq ("three")
      expect(@syntax.fileElements[0].extern_requirements[3].name)
        .to eq ("four")
      expect(@syntax.fileElements[0].extern_requirements[4].name)
        .to eq ("five")
      expect(@syntax.fileElements[0].extern_requirements[5].name).to eq ("six")
      expect(@syntax.fileElements[0].extern_requirements.size).to eq (9)
    end

    it "Correct state transition (require)." do
      path = "spec/samples/rubySyntaxParts/extern/simpleExternRequirement.rb"

      expect(@syntax.state)
          .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
      @syntax.analyse_source(path)
      expect(@syntax.state)
          .to be_instance_of(StateMachine::OOStructuredFSM::IdleState)
    end

    it "Correct data capture (require)." do
      path = "spec/samples/rubySyntaxParts/extern/simpleExternRequirement.rb"

      @syntax.analyse_source(path)
      expect(@syntax.fileElements[0].extern_requirements[0].name).to eq ("one")
      expect(@syntax.fileElements[0].extern_requirements[1].name).to eq ("two")
      expect(@syntax.fileElements[0].extern_requirements[2].name)
        .to eq ("three")
      expect(@syntax.fileElements[0].extern_requirements[3].name)
        .to eq ("four")
      expect(@syntax.fileElements[0].extern_requirements[4].name)
        .to eq ("five")
      expect(@syntax.fileElements[0].extern_requirements[5].name).to eq ("six")
      expect(@syntax.fileElements[0].extern_requirements[6].name)
        .to eq ("seven")
      expect(@syntax.fileElements[0].extern_requirements[7].name)
        .to eq ("eight")
      expect(@syntax.fileElements[0].extern_requirements[8].name)
        .to eq ("nine")
      expect(@syntax.fileElements[0].extern_requirements.size).to eq (9)
    end

  end

  after :each do
    @syntax = nil
  end

end
