require "rails_helper"

RSpec.describe "GET API V1 tasks request", type: :request do
  describe "GET /api/v1/tasks" do
    describe "happy path" do
      it "returns a list of tasks" do

        task_1 = Task.create!(name: "Create Front End", description: "Make React app after this dawggy", completed: false )
        task_2 = Task.create!(name: "Connect the two", description: "Connect front and back end", completed: false )


        get api_v1_tasks_path

        expect(response.status).to eq(200)
        expect(response).to be_successful

        all_tasks_response = JSON.parse(response.body, symbolize_names: true)

        expect(all_tasks_response[:data].count).to eq(2)
        all_tasks_response[:data].each do |task|
          expect(task).to be_a(Hash)

          expect(task).to have_key(:id)
          expect(task[:id].to_i).to be_an(Integer)

          expect(task).to have_key(:type)
          expect(task[:type]).to eq("task")

          expect(task[:attributes]).to have_key(:name)
          expect(task[:attributes][:name]).to be_a(String)
          expect(task[:attributes][:description]).to be_a(String)
          # expect(task[:attributes][:completed]).to be_a(Boolean)
        end
      end
    end
  end
end