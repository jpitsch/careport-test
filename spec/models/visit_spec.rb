require "rails_helper"

RSpec.describe Visit do
  context "Given a visit" do
    subject { FactoryBot.create(:visit) }

    it "has a patient" do
      expect(subject.patient)
        .to_not be_blank
    end

    it "has a patient date of birth" do
      expect(subject.patient_dob)
        .to_not be_blank
    end

    it "has an admit_date" do
      expect(subject.admit_date)
        .to_not be_blank
    end

    # Not sure this is even a type that is there since they are all hospitals
    # context "when the visit is visit_type 1" do
    #   subject { FactoryBot.create(:visit, visit_type: 1) }

    #   it "is a Hospital" do
    #     expect(subject.visit_type)
    #       .to eq("Hospital")
    #   end
    # end

    context "when the visit is visit_type 2" do
      subject { FactoryBot.create(:visit, :snf) }

      it "is a SNF" do
        expect(subject.visit_type)
          .to eq("SNF")
      end
    end

    context "when the visit is visit_type 3" do
      subject { FactoryBot.create(:visit, :hospice) }

      it "is a Hospice" do
        expect(subject.visit_type)
          .to eq("Hospice")
      end
    end

    context "when the visit is visit_type 4" do
      subject { FactoryBot.create(:visit, :hha) }

      it "is an HHA" do
        expect(subject.visit_type)
          .to eq("HHA")
      end
    end
  end
end
