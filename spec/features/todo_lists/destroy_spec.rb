require 'spec_helper'

describe "Deleting todo lists" do
	let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery list.") }

	it "is successful when clicking the destory link" do
		visit "/todo_lists"

		within dom_id_for(todo_list) do
			click_link "Destroy"
		end

		expect(page).to_not have_content(todo_list.title)
		expect(TodoList.count).to eq(0) 
	end
end