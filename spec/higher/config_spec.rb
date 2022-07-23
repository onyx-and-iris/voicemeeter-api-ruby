require_relative '../tests_helper'
require_relative 'higher_shared'

RSpec.describe 'All Config Tests', :higher do
    before :all do
      VMUnit.testing.apply_config('example')
    end

    describe 'strip A1' do
        include_context 'strip, set and get higher'
        let(:index) { VMUnit.phys_in }

        it "should return A1 as true" do
            expect(when_get("A1")).to eq true
        end
    end

    describe 'strip label' do
        include_context 'strip, set and get higher'

        describe 'strip, physical' do
            let(:index) { VMUnit.phys_in }
            it "should return label includes PhysStrip" do
                expect(when_get("label")).to include("PhysStrip")
            end
        end
        describe 'strip, virtual' do
            let(:index) { VMUnit.virt_in }
            it "should return label includes VirtStrip" do
                expect(when_get("label")).to include("VirtStrip")
            end
        end
    end

    describe 'bus label' do
        include_context 'bus, set and get higher'

        describe 'bus, physical' do
            let(:index) { VMUnit.phys_out }
            it "should return label includes PhysBus" do
                expect(when_get("label")).to include("PhysBus")
            end
        end
        describe 'bus, virtual' do
            let(:index) { VMUnit.virt_out }
            it "should return label includes VirtBus" do
                expect(when_get("label")).to include("VirtBus")
            end
        end
    end
end
