require "spec_helper"

module Whowas
  describe Middleware, type: :middleware do
    let!(:dummy_class) { Class.new{ include Middleware } }
    let(:app) { lambda { |env| } }
    let!(:dummy_instance) { dummy_class.new(app) }
    let(:env) { Hash.new }
    
    before do
      valid_results = { raw: "I am a results string with a new ip", input: {ip: "new ip"}, method: "FakeSearchMethod"}
      allow(dummy_instance).to receive(:search).with(valid_input_results).and_return(valid_results)
      allow(dummy_instance).to receive(:search).with(valid_input_no_results).and_return({results: "", input: {}})      
      allow(dummy_instance).to receive(:search).with(invalid_input).and_raise(Whowas::Errors::InvalidInput)
    end
    
    describe "#call" do      
      context "when results are found" do
        before(:each) do
          env[:input] = valid_input_results
        end         
        
        it "adds the search method and the raw results to env[:results]" do
          dummy_instance.call(env)
          expect(env[:results]).to include({"FakeSearchMethod" => "I am a results string with a new ip"})
        end 
          
        it "calls the next middleware with added input" do
          expect(app).to receive(:call).with({
            input: {
              ip: "new ip", 
              timestamp: env[:input][:timestamp]
            },
            results: [{"FakeSearchMethod" => "I am a results string with a new ip"}]
          })
          dummy_instance.call(env)
        end
      end
      
      context "when no results are found" do
        it "does not change env" do
          env[:input] = valid_input_no_results
          old_env = env
          dummy_instance.call(env)
          expect(env).to eq old_env
        end
        
        it "returns a string saying no results were found" do
          env[:input] = valid_input_no_results
          expect(dummy_instance.call(env)).to eq [{nil => "No results found."}]
        end
      end
      
      context "when the search encounters a problem" do
        it "returns a hash of the result and the error" do
          env[:input] = invalid_input
          expect(dummy_instance.call(env)).to be_a Whowas::Errors::InvalidInput
        end
      end
    end
  end
end