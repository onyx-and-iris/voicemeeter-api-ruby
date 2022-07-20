require_relative '../tests_helper'
require_relative 'lower_shared'

RSpec.describe 'All Lower Tests', :lower do
    describe 'VBVMR_SetParameterFloat, VBVMR_GetParameterFloat' do
        describe 'Strip physical' do
            let(:index) { VMUnit.phys_in }
            include_context 'strip, set and get lower'

            it { does_set('mute', 1); expect(when_get('mute')).to eq 1 }
            it { does_set('mute', 0); expect(when_get('mute')).to eq 0 }
        end

        describe 'Bus virtual' do
            let(:index) { VMUnit.virt_out }
            include_context 'bus, set and get lower'

            it { does_set('mono', 1); expect(when_get('mono')).to eq 1 }
            it { does_set('mono', 0); expect(when_get('mono')).to eq 0 }
        end
    end

    describe 'VBVMR_SetParameterStringA, VBVMR_GetParameterStringA' do
        describe 'Strip physical' do
            let(:index) { VMUnit.phys_in }
            include_context 'strip, set and get lower'

            it { does_set('label', 'test0'); expect(when_get('label', string = true)).to eq 'test0' }
            it { does_set('label', 'test1'); expect(when_get('label', string = true)).to eq 'test1' }
        end
    end

    describe 'VBVMR_MacroButton_SetStatus, VBVMR_MacroButton_GetStatus' do
        include_context 'macrobutton, set and get lower'
        describe 'Macrobutton 0' do
            let(:index) { 0 }

            it { does_set(1, mode = 1); expect(when_get(mode = 1)).to eq 1 }
            it { does_set(0, mode = 1); expect(when_get(mode = 1)).to eq 0 }
        end

        describe 'Macrobutton 35' do
            let(:index) { 35 }

            it { does_set(1, mode = 2); expect(when_get(mode = 2)).to eq 1 }
            it { does_set(0, mode = 2); expect(when_get(mode = 2)).to eq 0 }
        end

        describe 'Macrobutton 79' do
            let(:index) { 79 }

            it { does_set(1, mode = 3); expect(when_get(mode = 3)).to eq 1 }
            it { does_set(0, mode = 3); expect(when_get(mode = 3)).to eq 0 }
        end
    end
end
