# frozen_string_literal: true

require_relative '../calculator'

RSpec.describe Calculator do
  subject { Calculator.new(sum) }

  describe '#calculate' do
    context 'one operand' do
      context 'Zero' do
        let(:sum) { '0' }

        it 'gives the correct result' do
          expect(subject.calculate).to eq(0)
        end
      end
    end

    context 'two operands' do
      context 'subtraction' do
        let(:sum) { '243 - 43' }

        it 'gives the correct result' do
          expect(subject.calculate).to eq(200)
        end
      end
    end

    context 'two operands' do
      context 'addition' do
        let(:sum) { '243 + 43' }

        it 'gives the correct result' do
          expect(subject.calculate).to eq(286)
        end
      end
    end

    context 'chained operations' do
      context 'addition and division' do
        let(:sum) { '20 + 10 / 5' }

        it 'gives the correct result' do
          expect(subject.calculate).to eq(22)
        end
      end
    end

    context 'chained operations' do
      context 'exponents and division' do
        let(:sum) { '20 ** 4 / 8' }

        it 'gives the correct result' do
          expect(subject.calculate).to eq(20_000)
        end
      end
    end

    context 'no whitespace' do
      let(:sum) { '20+4' }

      it 'gives the correct result' do
        expect(subject.calculate).to eq(24)
      end
    end
  end
end
