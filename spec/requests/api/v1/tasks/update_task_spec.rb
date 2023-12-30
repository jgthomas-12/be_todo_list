require "rails_helper"

RSpec.describe "PATCH API V1 tasks request", type: :request do
  describe "PATCH /api/v1/tasks" do
    describe "happy path" do
      it "updates a task by id" do

        task_1 = Task.create!(name: "Create Front End", description: "Make React app after this dawggy", completed: false )

        updated_task_params = {
          name: "Listen to Gladiator soundtrack",
          description: "While working on this project",
          completed: false
        }

        expect(Task.all.count).to eq(1)

        patch api_v1_task_path(task_1.id), params: updated_task_params

        expect(response.status).to eq(200)
        expect(response).to be_successful

        updated_task_response = JSON.parse(response.body, symbolize_names: true)

        expect(Task.all.count).to eq(1)
        expect(updated_task_response).to be_a(Hash)
        expect(updated_task_response).to have_key(:success)
        expect(updated_task_response).to have_value("Task updated successfully")
      end
    end
  end
end