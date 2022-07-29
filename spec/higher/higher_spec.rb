require_relative '../tests_helper'
require_relative 'higher_shared'

RSpec.describe 'All Higher Tests', :higher do
    describe 'Bool tests', :bool do
        describe 'strip, physical and virtual' do
            include_context 'strip, set and get higher'
            describe 'strip, physical' do
                let(:index) { VMUnit.phys_in }
                ['solo', 'mono', "A#{VMUnit.num_A}", 'postreverb', 'postdelay'].each do |param|
                    let(:param) { param }

                    it { does_set(param, true); expect(when_get(param)).to eq true }
                    it { does_set(param, false); expect(when_get(param)).to eq false }
                end
            end

            describe 'strip, physical effects', :if => %w[potato].include?(VMUnit.kind_name) do
                let(:index) { VMUnit.phys_in }
                ['postreverb', 'postdelay'].each do |param|
                    let(:param) { param }

                    it { does_set(param, true); expect(when_get(param)).to eq true }
                    it { does_set(param, false); expect(when_get(param)).to eq false }
                end
            end

            describe 'strip, virtual' do
                let(:index) { VMUnit.virt_in }
                ['solo', "B#{VMUnit.num_B}"].each do |param|
                    let(:param) { param }

                    it { does_set(param, true); expect(when_get(param)).to eq true }
                    it { does_set(param, false); expect(when_get(param)).to eq false }
                end
            end
        end

        describe 'bus, physical and virtual' do
            include_context 'bus, set and get higher'
            describe 'bus, physical' do
                let(:index) { VMUnit.phys_out }
                ['eq'].each do |param|
                    let(:param) { param }

                    it { does_set(param, true); expect(when_get(param)).to eq true }
                    it { does_set(param, false); expect(when_get(param)).to eq false }
                end
            end

            describe 'bus, virtual' do
                let(:index) { VMUnit.virt_out }
                ['mute'].each do |param|
                    let(:param) { param }

                    it { does_set(param, true); expect(when_get(param)).to eq true }
                    it { does_set(param, false); expect(when_get(param)).to eq false }
                end
            end
        end

        describe 'macrobuttons' do
            include_context 'macrobutton, set and get higher'
            describe 'macrobutton 10' do
                let(:index) { 10 }
                ['stateonly'].each do |param|
                    let(:param) { param }

                    it { does_set(param, true); expect(when_get(param)).to eq true }
                    it { does_set(param, false); expect(when_get(param)).to eq false }
                end
            end

            describe 'macrobutton 65' do
                let(:index) { 65 }
                ['stateonly'].each do |param|
                    let(:param) { param }

                    it { does_set(param, true); expect(when_get(param)).to eq true }
                    it { does_set(param, false); expect(when_get(param)).to eq false }
                end
            end
        end

        describe 'command' do
            include_context 'command, set and get higher'
            ['lock'].each do |param|
                it { does_set(param, true) }
                it { does_set(param, false) }
            end
        end

        describe 'vban' do
            let(:index) { VMUnit.vban_in }
            describe 'vban.instream' do
                include_context 'vban.instream, set and get higher'
                ['on'].each do |param|
                    it { does_set(param, true); expect(when_get(param)).to eq true }
                    it { does_set(param, false); expect(when_get(param)).to eq false }
                end
            end

            describe 'vban.outstream' do
                include_context 'vban.outstream, set and get higher'
                ['on'].each do |param|
                    it { does_set(param, true); expect(when_get(param)).to eq true }
                    it { does_set(param, false); expect(when_get(param)).to eq false }
                end
            end
        end

        describe 'recorder', :if => %w[banana potato].include?(VMUnit.kind_name) do
            include_context 'recorder, set and get higher'
            %w[A1 B1].each do |param|
                it { does_set(param, true); expect(when_get(param)).to eq true }
                it { does_set(param, false); expect(when_get(param)).to eq false }
            end
        end
    end

    describe 'Float tests', :float do
        describe 'strip, physical and virtual' do
            include_context 'strip, set and get higher'
            describe 'strip, physical' do
                let(:index) { VMUnit.phys_in }
                ['gain'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 4.7); expect(when_get(param)).to eq 4.7 }
                    it { does_set(param, -30.8); expect(when_get(param)).to eq -30.8 }
                end

                ['reverb', 'delay', 'fx1'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 0.8); expect(when_get(param)).to eq 0.8 }
                    it { does_set(param, 8.7); expect(when_get(param)).to eq 8.7 }
                end

                ['pan_x', 'color_x', 'fx_x'].each do |param|
                    let(:param) { param }

                    it { does_set(param, -0.3); expect(when_get(param)).to eq -0.3 }
                    it { does_set(param, 0.2); expect(when_get(param)).to eq 0.2 }
                end

                ['pan_y', 'color_y', 'fx_y'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 0.1); expect(when_get(param)).to eq 0.1 }
                    it { does_set(param, 0.8); expect(when_get(param)).to eq 0.8 }
                end 
            end

            describe 'strip, physical effects', :if => %w[potato].include?(VMUnit.kind_name) do
                let(:index) { VMUnit.phys_in }
                ['reverb', 'delay', 'fx1'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 0.8); expect(when_get(param)).to eq 0.8 }
                    it { does_set(param, 8.7); expect(when_get(param)).to eq 8.7 }
                end
            end

            describe 'strip, virtual' do
                let(:index) { VMUnit.virt_in }
                ['gain'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 0.8); expect(when_get(param)).to eq 0.8 }
                    it { does_set(param, -60.0); expect(when_get(param)).to eq -60.0 }
                end
            end
        end

        describe 'strip.gainlayer, physical and virtual', :if => %w[potato].include?(VMUnit.kind_name) do
            include_context 'strip.gainlayer, set and get higher'
            describe 'strip, physical' do
                let(:index) { VMUnit.phys_in }
                let(:j) { (0...8).to_a.sample }
                ['gain'].each do |param|
                    let(:param) { param }

                    it { does_set(param, -4.7); expect(when_get(param)).to eq -4.7 }
                    it { does_set(param, -30.8); expect(when_get(param)).to eq -30.8 }
                end
            end
        end        

        describe 'bus, physical and virtual' do
            include_context 'bus, set and get higher'
            describe 'bus, physical' do
                let(:index) { VMUnit.phys_out }
                ['gain'].each do |param|
                    let(:param) { param }

                    it { does_set(param, -12.2); expect(when_get(param)).to eq -12.2 }
                    it { does_set(param, 5.6); expect(when_get(param)).to eq 5.6 }
                end
            end

            describe 'bus, physical', :if => %w[potato].include?(VMUnit.kind_name) do
                let(:index) { VMUnit.phys_out }
                ['returnreverb', 'returnfx1'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 3.2); expect(when_get(param)).to eq 3.2 }
                    it { does_set(param, 8.1); expect(when_get(param)).to eq 8.1 }
                end
            end

            describe 'bus, virtual' do
                let(:index) { VMUnit.virt_out }
                ['gain'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 6.9); expect(when_get(param)).to eq 6.9 }
                    it { does_set(param, -18.3); expect(when_get(param)).to eq -18.3 }
                end
            end

            describe 'bus, virtual', :if => %w[potato].include?(VMUnit.kind_name) do
                let(:index) { VMUnit.virt_out }
                ['returnreverb', 'returnfx1'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 3.2); expect(when_get(param)).to eq 3.2 }
                    it { does_set(param, 8.1); expect(when_get(param)).to eq 8.1 }
                end
            end
        end
    end

    describe 'String tests', :string do
        describe 'strip, physical and virtual' do
            include_context 'strip, set and get higher'
            describe 'strip, physical' do
                let(:index) { VMUnit.phys_in }
                ['label'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 'test0'); expect(when_get(param)).to eq 'test0' }
                    it { does_set(param, 'test1'); expect(when_get(param)).to eq 'test1' }
                end
            end

            describe 'strip, virtual' do
                let(:index) { VMUnit.virt_in }
                ['label'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 'test0'); expect(when_get(param)).to eq 'test0' }
                    it { does_set(param, 'test1'); expect(when_get(param)).to eq 'test1' }
                end
            end
        end

        describe 'bus, physical and virtual' do
            include_context 'bus, set and get higher'
            describe 'bus, physical' do
                let(:index) { VMUnit.phys_out }
                ['label'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 'test0'); expect(when_get(param)).to eq 'test0' }
                    it { does_set(param, 'test1'); expect(when_get(param)).to eq 'test1' }
                end
            end

            describe 'bus, virtual' do
                let(:index) { VMUnit.virt_out }
                ['label'].each do |param|
                    let(:param) { param }

                    it { does_set(param, 'test0'); expect(when_get(param)).to eq 'test0' }
                    it { does_set(param, 'test1'); expect(when_get(param)).to eq 'test1' }
                end
            end
        end

        describe 'vban' do
            let(:index) { VMUnit.vban_in }
            describe 'vban.instream' do
                include_context 'vban.instream, set and get higher'
                ['name'].each do |param|
                    it { does_set(param, 'streamname0'); expect(when_get(param)).to eq 'streamname0' }
                    it { does_set(param, 'streamname1'); expect(when_get(param)).to eq 'streamname1' }
                end
            end

            describe 'vban.outstream' do
                include_context 'vban.outstream, set and get higher'
                ['name'].each do |param|
                    it { does_set(param, 'streamname0'); expect(when_get(param)).to eq 'streamname0' }
                    it { does_set(param, 'streamname1'); expect(when_get(param)).to eq 'streamname1' }
                end
            end
        end
    end

    describe 'Int tests', :int do
        describe 'strip, physical and virtual' do
            include_context 'strip, set and get higher'
            describe 'strip, physical' do
                let(:index) { VMUnit.phys_in }
                ['limit'].each do |param|
                    let(:param) { param }

                    it { does_set(param, -40); expect(when_get(param)).to eq -40 }
                    it { does_set(param, 12); expect(when_get(param)).to eq 12 }
                end
            end

            describe 'strip, virtual' do
                let(:index) { VMUnit.virt_in }
                ['limit'].each do |param|
                    let(:param) { param }

                    it { does_set(param, -5); expect(when_get(param)).to eq -5 }
                    it { does_set(param, 3); expect(when_get(param)).to eq 3 }
                end
            end
        end
    end
end
