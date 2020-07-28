require "rails_helper"

describe HospitalsService do
  let(:hospital_id) { 42 }
  let(:code) { nil }
  let(:instance) { described_class.new(hospital_id: hospital_id, code: code) }
  subject { instance }

  let(:code_1) {
    [
      {"code"=>"COVNEG", "name"=>"COV-19 test: negative"}, 
      {"code"=>"COVSUS", "name"=>"Suspected covid by dx"}, 
      {"code"=>"COVPOS", "name"=>"COV-19 test: positive"}
    ]
  }

  let(:code_2) {
    [
      {"code"=>"ESE", "name"=>"asperiores earum"}, 
      {"code"=>"CEB", "name"=>"nihil voluptatem"}, 
      {"code"=>"NSP", "name"=>"fugiat consequatur"}, 
      {"code"=>"ESE", "name"=>"asperiores earum"}, 
      {"code"=>"ESE", "name"=>"asperiores earum"}
    ] 
  }

  let(:code_3) {
    [
      {"code"=>"CWE", "name"=>"ab odio"}, 
      {"code"=>"NSP", "name"=>"fugiat consequatur"}, 
      {"code"=>"KBK", "name"=>"aut est"}, 
      {"code"=>"ESE", "name"=>"asperiores earum"}, 
      {"code"=>"ESE", "name"=>"asperiores earum"}
    ]
  }

  before do
    FactoryBot.create(:visit, :snf, codes: code_1, hospital_id: 42)
    FactoryBot.create(:visit, :hospice, codes: code_2, hospital_id: 42)
    FactoryBot.create(:visit, :hha, codes: code_3, hospital_id: 42)
    FactoryBot.create(:visit, codes: code_1, hospital_id: 22)
  end

  describe '#visits_by_hospital' do
    context 'when code is nil' do
      it 'will return all the hospitals with ID of 42' do
        expect(subject.visits_by_hospital.length).to eq(3)
      end
    end

    context 'when there is a valid code selected' do
      let(:code) { 'COVPOS' }

      it 'will return visits that have "COVPOS" in codes' do
        expect(subject.visits_by_hospital.length).to eq(1)
      end
    end
  end
end