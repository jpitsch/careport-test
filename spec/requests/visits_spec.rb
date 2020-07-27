require 'rails_helper'

RSpec.describe "Visits", type: :request do
  context "Given there are visits of different types" do
    let!(:snf_visit) { FactoryBot.create(:visit, :snf) }
    let!(:hospice_visit) { FactoryBot.create(:visit, :hospice) }
    let!(:hha_visit) { FactoryBot.create(:visit, :hha) }

    describe "GET /" do
      before do
        visit "/"
      end

      it "has all three visits' hospitals on the page" do
        expect(page)
          .to have_content(snf_visit.hospital_name)
        expect(page)
          .to have_content(hospice_visit.hospital_name)
        expect(page)
          .to have_content(hha_visit.hospital_name)
      end

      context "when we select hha visit type" do
        before do
          page.select("HHA", from: "Type")
          page.find("#search").click
        end

        it "only shows the hha visit" do
          expect(page)
            .to_not have_content(snf_visit.hospital_name)
          expect(page)
            .to_not have_content(hospice_visit.hospital_name)
          expect(page)
            .to have_content(hha_visit.hospital_name)
        end
      end
    end
  end
end
