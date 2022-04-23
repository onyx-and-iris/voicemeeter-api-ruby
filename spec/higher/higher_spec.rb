require_relative '../tests_helper'
require_relative 'higher_shared'

RSpec.describe 'All Higher Tests', :higher do
    describe 'Bool tests', :bool do
        describe 'strip, physical and virtual' do
            include_context 'strip, set and get higher'
            describe 'strip, physical' do
                let(:index) { 1 }
                %w[solo mono A1].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, true)
                        expect(when_get(param)).to eq true
                    end
                    it do
                        does_set(param, false)
                        expect(when_get(param)).to eq false
                    end
                end
            end

            describe 'strip, virtual' do
                let(:index) { 3 }
                %w[mc B2].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, true)
                        expect(when_get(param)).to eq true
                    end
                    it do
                        does_set(param, false)
                        expect(when_get(param)).to eq false
                    end
                end
            end
        end

        describe 'bus, physical and virtual' do
            include_context 'bus, set and get higher'
            describe 'bus, physical' do
                let(:index) { 0 }
                ['eq'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, true)
                        expect(when_get(param)).to eq true
                    end
                    it do
                        does_set(param, false)
                        expect(when_get(param)).to eq false
                    end
                end
            end

            describe 'bus, virtual' do
                let(:index) { 4 }
                ['mute'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, true)
                        expect(when_get(param)).to eq true
                    end
                    it do
                        does_set(param, false)
                        expect(when_get(param)).to eq false
                    end
                end
            end
        end

        describe 'macrobuttons' do
            include_context 'macrobutton, set and get higher'
            describe 'macrobutton 10' do
                let(:index) { 10 }
                ['stateonly'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, true)
                        expect(when_get(param)).to eq true
                    end
                    it do
                        does_set(param, false)
                        expect(when_get(param)).to eq false
                    end
                end
            end

            describe 'macrobutton 65' do
                let(:index) { 65 }
                ['stateonly'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, true)
                        expect(when_get(param)).to eq true
                    end
                    it do
                        does_set(param, false)
                        expect(when_get(param)).to eq false
                    end
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
            let(:index) { 0 }
            describe 'vban.instream' do
                include_context 'vban.instream, set and get higher'
                ['on'].each do |param|
                    it do
                        does_set(param, true)
                        expect(when_get(param)).to eq true
                    end
                    it do
                        does_set(param, false)
                        expect(when_get(param)).to eq false
                    end
                end
            end

            describe 'vban.outstream' do
                include_context 'vban.outstream, set and get higher'
                ['on'].each do |param|
                    it do
                        does_set(param, true)
                        expect(when_get(param)).to eq true
                    end
                    it do
                        does_set(param, false)
                        expect(when_get(param)).to eq false
                    end
                end
            end
        end

        describe 'recorder' do
            include_context 'recorder, set and get higher'
            %w[A3 B2].each do |param|
                it do
                    does_set(param, true)
                    expect(when_get(param)).to eq true
                end
                it do
                    does_set(param, false)
                    expect(when_get(param)).to eq false
                end
            end
        end
    end

    describe 'Float tests', :float do
        describe 'strip, physical and virtual' do
            include_context 'strip, set and get higher'
            describe 'strip, physical' do
                let(:index) { 0 }
                ['gain'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, 4.7)
                        expect(when_get(param)).to eq 4.7
                    end
                    it do
                        does_set(param, -30.8)
                        expect(when_get(param)).to eq -30.8
                    end
                end
            end

            describe 'strip, virtual' do
                let(:index) { 3 }
                ['gain'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, 0.8)
                        expect(when_get(param)).to eq 0.8
                    end
                    it do
                        does_set(param, -60.0)
                        expect(when_get(param)).to eq -60.0
                    end
                end
            end
        end

        describe 'bus, physical and virtual' do
            include_context 'bus, set and get higher'
            describe 'bus, physical' do
                let(:index) { 0 }
                ['gain'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, -12.2)
                        expect(when_get(param)).to eq -12.2
                    end
                    it do
                        does_set(param, 5.6)
                        expect(when_get(param)).to eq 5.6
                    end
                end
            end

            describe 'bus, virtual' do
                let(:index) { 4 }
                ['gain'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, 6.9)
                        expect(when_get(param)).to eq 6.9
                    end
                    it do
                        does_set(param, -18.3)
                        expect(when_get(param)).to eq -18.3
                    end
                end
            end
        end
    end

    describe 'String tests', :string do
        describe 'strip, physical and virtual' do
            include_context 'strip, set and get higher'
            describe 'strip, physical' do
                let(:index) { 0 }
                ['label'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, 'test0')
                        expect(when_get(param)).to eq 'test0'
                    end
                    it do
                        does_set(param, 'test1')
                        expect(when_get(param)).to eq 'test1'
                    end
                end
            end

            describe 'strip, virtual' do
                let(:index) { 3 }
                ['label'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, 'test0')
                        expect(when_get(param)).to eq 'test0'
                    end
                    it do
                        does_set(param, 'test1')
                        expect(when_get(param)).to eq 'test1'
                    end
                end
            end
        end

        describe 'bus, physical and virtual' do
            include_context 'bus, set and get higher'
            describe 'bus, physical' do
                let(:index) { 0 }
                ['label'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, 'test0')
                        expect(when_get(param)).to eq 'test0'
                    end
                    it do
                        does_set(param, 'test1')
                        expect(when_get(param)).to eq 'test1'
                    end
                end
            end

            describe 'bus, virtual' do
                let(:index) { 4 }
                ['label'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, 'test0')
                        expect(when_get(param)).to eq 'test0'
                    end
                    it do
                        does_set(param, 'test1')
                        expect(when_get(param)).to eq 'test1'
                    end
                end
            end
        end

        describe 'vban' do
            let(:index) { 0 }
            describe 'vban.instream' do
                include_context 'vban.instream, set and get higher'
                ['name'].each do |param|
                    it do
                        does_set(param, 'streamname0')
                        expect(when_get(param)).to eq 'streamname0'
                    end
                    it do
                        does_set(param, 'streamname1')
                        expect(when_get(param)).to eq 'streamname1'
                    end
                end
            end

            describe 'vban.outstream' do
                include_context 'vban.outstream, set and get higher'
                ['name'].each do |param|
                    it do
                        does_set(param, 'streamname0')
                        expect(when_get(param)).to eq 'streamname0'
                    end
                    it do
                        does_set(param, 'streamname1')
                        expect(when_get(param)).to eq 'streamname1'
                    end
                end
            end
        end
    end

    describe 'Int tests', :int do
        describe 'strip, physical and virtual' do
            include_context 'strip, set and get higher'
            describe 'strip, physical' do
                let(:index) { 0 }
                ['limit'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, -40)
                        expect(when_get(param)).to eq -40
                    end
                    it do
                        does_set(param, 12)
                        expect(when_get(param)).to eq 12
                    end
                end
            end

            describe 'strip, virtual' do
                let(:index) { 3 }
                ['limit'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, -5)
                        expect(when_get(param)).to eq -5
                    end
                    it do
                        does_set(param, 3)
                        expect(when_get(param)).to eq 3
                    end
                end
                let(:index) { 4 }
                ['k'].each do |param|
                    let(:param) { param }

                    it do
                        does_set(param, 1)
                        expect(when_get(param)).to eq 1
                    end
                    it do
                        does_set(param, 4)
                        expect(when_get(param)).to eq 4
                    end
                end
            end
        end
    end
end
