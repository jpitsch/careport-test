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

    context "when the visit is visit_type 1" do
      subject { FactoryBot.create(:visit, visit_type: 1) }

      it "is a hospital" do
        expect(subject.type)
          .to eq("hospital")
      end
    end

    context "when the visit is visit_type 2" do
      subject { FactoryBot.create(:visit, visit_type: 2) }

      it "is a SNF" do
        expect(subject.type)
          .to eq("SNF")
      end
    end

    context "when the visit is visit_type 3" do
      subject { FactoryBot.create(:visit, visit_type: 3) }

      it "is a hospice" do
        expect(subject.type)
          .to eq("hospice")
      end
    end

    context "when the visit is visit_type 4" do
      subject { FactoryBot.create(:visit, visit_type: 4) }

      it "is an HHA" do
        expect(subject.type)
          .to eq("HHA")
      end
    end
  end
end
