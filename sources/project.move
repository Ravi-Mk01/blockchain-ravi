module MyModule::ToDoList {

    use aptos_framework::signer;

    /// Struct representing a ToDo item.
    struct Task has store, key {
        description: vector<u8>,  // Description of the task
        completed: bool,          // Whether the task is completed
    }

    /// Function to create a new task.
    public fun create_task(account: &signer, description: vector<u8>) {
        let task = Task {
            description,
            completed: false,
        };
        move_to(account, task);
    }

    /// Function to mark a task as completed.
    public fun mark_task_completed(account: &signer) acquires Task {
        let task = borrow_global_mut<Task>(signer::address_of(account));
        task.completed = true;
    }
}
