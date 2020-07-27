require 'rails_helper'

RSpec.describe "Hospital Aggregations", type: :request do
  context "Given two hospitals with pac data" do
    let(:first_hospital) {{
      name: "First Hospital",
      id: "first-hospital"
    }}

    let(:second_hospital) {{
      name: "Second Hospital",
      id: "second-hospital"
    }}

    let!(:first_snfs) do
      FactoryBot.create_list(
        :visit,
        2,
        :snf,
        hospital_name: first_hospital[:name],
        hospital_id: first_hospital[:id]
      )
    end

    let!(:first_hhas) do
      FactoryBot.create_list(
        :visit,
        3,
        :hha,
        hospital_name: first_hospital[:name],
        hospital_id: first_hospital[:id]
      )
    end

    let!(:second_snfs) do
      FactoryBot.create_list(
        :visit,
        4,
        :snf,
        pac: "foo-pac",
        hospital_name: second_hospital[:name],
        hospital_id: second_hospital[:id]
      )
    end

    context "when we visit the page for the first hospital" do
      before do
        visit "hospitals/first-hospital"
      end

      let(:result_rows) do
        page.all("tbody tr")
      end

      it "shows the pacs for that hospital only" do
        expect(result_rows.count)
          .to eq(5)
      end

    end

    context "when we visit a hospital that has multiple visits for a single pac" do
      before do
        visit "hospitals/second-hospital"
      end

      let(:visit_counts) do
        page.all(".visit_count").map(&:text)
      end

      it "sums the total number of visits per pac" do
        expect(visit_counts)
          .to contain_exactly(second_snfs.count.to_s)
      end
    end
  end
end

