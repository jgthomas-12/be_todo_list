require "rails_helper"

RSpec.describe "POST API V1 tasks request", type: :request do
  describe "POST /api/v1/tasks" do
    describe "happy path" do
      it "creates a task from valid parameters" do
        new_task_params = {
          name: "Make POST request",
          description: "Establish the ability to post tasks via an endpoint for the front end",
          completed: false
        }
        expect(Task.all.count).to eq(0)
        post api_v1_tasks_path, params: new_task_params, as: :json

        expect(response.status).to eq(201)
        expect(response).to be_successful

        new_task_response = JSON.parse(response.body, symbolize_names: true)

        expect(Task.all.count).to eq(1)
        expect(new_task_response).to be_a(Hash)
        expect(new_task_response).to have_key(:success)
        expect(new_task_response).to have_value("Task added successfully")
      end
    end
  end
end