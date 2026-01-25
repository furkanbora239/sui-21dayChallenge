/// DAY 9: Enums & TaskStatus
/// 
/// Today you will:
/// 1. Learn about enums
/// 2. Replace bool with an enum
/// 3. Use match expressions

module challenge::day_09 {
    use std::string::String;

    // Copy Task struct from day_08, but we'll update it

    // TODO: Define an enum called 'TaskStatus' with two variants:
    // - Open
    // - Completed
    // Add 'copy' and 'drop' abilities
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    // TODO: Update Task struct to use TaskStatus instead of done: bool
    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,  // Changed from done: bool
    }

    // TODO: Update new_task to set status = TaskStatus::Open
    public fun new_task(title: String, reward: u64): Task {
        // Your code here
        Task {
            title,
            reward,
            status: TaskStatus::Open
        }
    }

    // TODO: Write a function 'is_open' that checks if task.status == TaskStatus::Open
    public fun is_open(task: &Task): bool {
        // Your code here
        // Hint: task.status == TaskStatus::Open
        task.status == TaskStatus::Open
    }

    #[test]
    fun test_new_task(){
        let newTask = new_task("mahmut", 15);
        assert!(newTask.title == std::string::utf8(b"mahmut"), 0);
        assert!(newTask.reward == 15, 1);
        assert!(newTask.status == TaskStatus::Open, 2);
    }

    #[test]
    fun test_is_open(){
        let newTask = new_task("mahmut", 15);
        let isOpen = is_open(&newTask);

        assert!(isOpen == true, 0);
    }
}



