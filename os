
1-one.	Any shell scripting program. 

1. Factorial (Using Recursion):
bash
Copy code
#!/bin/bash
factorial() {
    if [ $1 -le 1 ]; then
        echo 1
    else
        echo $(( $1 * $(factorial $(( $1 - 1 )) ) ))
    fi
}

echo "Enter a number: "
read num
echo "Factorial of $num is $(factorial $num)"
2-two. Palindrome (Number and String):
bash
Copy code
#!/bin/bash
is_palindrome() {
    str=$1
    rev=$(echo $str | rev)
    if [ "$str" == "$rev" ]; then
        echo "$str is a palindrome."
    else
        echo "$str is not a palindrome."
    fi
}

echo "Enter a number or string: "
read input
is_palindrome $input
3-three. Bubble Sort:
bash
Copy code
#!/bin/bash
bubble_sort() {
    arr=("$@")
    n=${#arr[@]}
    for ((i = 0; i < n; i++)); do
        for ((j = 0; j < n - i - 1; j++)); do
            if [ "${arr[j]}" -gt "${arr[j+1]}" ]; then
                temp=${arr[j]}
                arr[j]=${arr[j+1]}
                arr[j+1]=$temp
            fi
        done
    done
    echo "Sorted array: ${arr[@]}"
}

echo "Enter numbers separated by spaces: "
read -a numbers
bubble_sort "${numbers[@]}"
4-four. Count Occurrences of a Substring:
bash
Copy code
#!/bin/bash
count_substring() {
    string=$1
    substring=$2
    echo "$string" | grep -o "$substring" | wc -l
}

echo "Enter the main string: "
read main_str
echo "Enter the substring to find: "
read sub_str
echo "Occurrences of '$sub_str': $(count_substring "$main_str" "$sub_str")"
5-five. Sum of Digits:
bash
Copy code
#!/bin/bash
sum_of_digits() {
    num=$1
    sum=0
    while [ $num -gt 0 ]; do
        sum=$((sum + num % 10))
        num=$((num / 10))
    done
    echo $sum
}

echo "Enter a number: "
read num
echo "Sum of digits: $(sum_of_digits $num)"
6. Reverse Digits:
bash
Copy code
#!/bin/bash
reverse_digits() {
    num=$1
    rev=0
    while [ $num -gt 0 ]; do
        rev=$((rev * 10 + num % 10))
        num=$((num / 10))
    done
    echo $rev
}

echo "Enter a number: "
read num
echo "Reversed number: $(reverse_digits $num)"
7. Armstrong Number:
bash
Copy code
#!/bin/bash
is_armstrong() {
    num=$1
    sum=0
    temp=$num
    while [ $temp -gt 0 ]; do
        digit=$((temp % 10))
        sum=$((sum + digit * digit * digit))
        temp=$((temp / 10))
    done
    if [ $sum -eq $num ]; then
        echo "$num is an Armstrong number."
    else
        echo "$num is not an Armstrong number."
    fi
}

echo "Enter a number: "
read num
is_armstrong $num
8. Array Operations (Insert, Delete, Search, Display):
bash
Copy code
#!/bin/bash
array_operations() {
    arr=("$@")
    echo "Array: ${arr[@]}"
    echo "1. Insert element"
    echo "2. Delete element"
    echo "3. Search element"
    echo "4. Display array"
    echo "Choose an option: "
    read option

    case $option in
        1)
            echo "Enter element to insert: "
            read element
            arr+=($element)
            echo "Array after insertion: ${arr[@]}"
            ;;
        2)
            echo "Enter element to delete: "
            read element
            arr=("${arr[@]/$element}")
            echo "Array after deletion: ${arr[@]}"
            ;;
        3)
            echo "Enter element to search: "
            read element
            if [[ " ${arr[@]} " =~ " $element " ]]; then
                echo "$element found in array."
            else
                echo "$element not found."
            fi
            ;;
        4)
            echo "Array: ${arr[@]}"
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
}

echo "Enter array elements separated by spaces: "
read -a array
array_operations "${array[@]}"
9. Factorial (Without Recursion):
bash
Copy code
#!/bin/bash
factorial() {
    num=$1
    fact=1
    for ((i = 1; i <= num; i++)); do
        fact=$((fact * i))
    done
    echo $fact
}

echo "Enter a number: "
read num
echo "Factorial of $num is $(factorial $num)"
10. Palindrome String:
bash
Copy code
#!/bin/bash
is_palindrome_string() {
    str=$1
    rev=$(echo $str | rev)
    if [ "$str" == "$rev" ]; then
        echo "$str is a palindrome string."
    else
        echo "$str is not a palindrome string."
    fi
}

echo "Enter a string: "
read str
is_palindrome_string $str


2.	Write a program demonstrating use of different system calls. 

#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>

int main() {

    int fd = open("example.txt",O_CREAT|O_WRONLY|O_TRUNC,S_IRUSR|S_IWUSR);
    if(fd==-1) {
        perror("There is a problem.");
        return 1;
    }

    char *text = "Hey there this is the file that is the example where we are making the use of some of the system calls for the Operating System Lab Examination.";
    ssize_t wr = write(fd,text,50);

    if(wr == -1) {
        perror("There was a problem in writing on the file.");
        close(fd);
        return 1;
    }

    pid_t pid = fork();
    if(pid==-1) {
        perror("There is a problem in forking the process.");
        return 1;
    }

    if(pid==0){
        printf("This is the child process and there is something to read from the example.txt file.");
        fd = open("example.txt",O_RDONLY);
        if(fd==-1){
            perror("There is a problem.");
            return 1;
        }
        char buffer [50] = {0};
        ssize_t rd = read(fd,buffer,50);
        if (rd == -1){
            perror("There is a problem in reading the file and putting it in the buffer.");
            close(fd);
            exit(1);
        } 
        printf("The buffer reads:%s\n",buffer);
        close(fd);
        exit(1);
    }  else {
        printf("This is the parent process and the pid of the process is:%d\n",getpid());
        wait(NULL);
        printf("The child process if finished.");
    }
    

    time_t current_time = time(NULL);
    if (current_time == -1) {
        perror("The time could not be fetched from the system.\n");
        return 1;
    }
    printf("The current time from the system is:%s\n",ctime(&current_time));

    return 0;

}
3.	Implement multithreading for Matrix Operations using Pthreads.
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define MAX 3  // Define the size of the matrix (for simplicity, a 3x3 matrix)

int A[MAX][MAX]; // Matrix A
int B[MAX][MAX]; // Matrix B
int result_add[MAX][MAX]; // Result matrix for addition
int result_mul[MAX][MAX]; // Result matrix for multiplication

// Structure to hold parameters for each thread
typedef struct {
    int row;
    int col;
} MatrixPos;

// Function for each thread to calculate a single element in the addition result matrix
void *matrix_add(void *param) {
    MatrixPos *pos = (MatrixPos *)param;
    int row = pos->row;
    int col = pos->col;

    // Calculate the element of the result matrix
    result_add[row][col] = A[row][col] + B[row][col];

    pthread_exit(0);
}

// Function for each thread to calculate a single element in the multiplication result matrix
void *matrix_multiply(void *param) {
    MatrixPos *pos = (MatrixPos *)param;
    int row = pos->row;
    int col = pos->col;

    result_mul[row][col] = 0;
    for (int k = 0; k < MAX; k++) {
        result_mul[row][col] += A[row][k] * B[k][col];
    }

    pthread_exit(0);
}

int main() {
    // Initialize matrices A and B with example values
    printf("Enter elements of 3x3 matrix A:\n");
    for (int i = 0; i < MAX; i++)
        for (int j = 0; j < MAX; j++)
            scanf("%d", &A[i][j]);

    printf("Enter elements of 3x3 matrix B:\n");
    for (int i = 0; i < MAX; i++)
        for (int j = 0; j < MAX; j++)
            scanf("%d", &B[i][j]);

    // Matrix addition with threads
    pthread_t threads_add[MAX][MAX];
    for (int i = 0; i < MAX; i++) {
        for (int j = 0; j < MAX; j++) {
            MatrixPos *pos = (MatrixPos *)malloc(sizeof(MatrixPos));
            pos->row = i;
            pos->col = j;
            pthread_create(&threads_add[i][j], NULL, matrix_add, (void *)pos);
        }
    }

    // Join addition threads
    for (int i = 0; i < MAX; i++) {
        for (int j = 0; j < MAX; j++) {
            pthread_join(threads_add[i][j], NULL);
        }
    }

    // Display addition result
    printf("\nResult of matrix addition:\n");
    for (int i = 0; i < MAX; i++) {
        for (int j = 0; j < MAX; j++) {
            printf("%d ", result_add[i][j]);
        }
        printf("\n");
    }

    // Matrix multiplication with threads
    pthread_t threads_mul[MAX][MAX];
    for (int i = 0; i < MAX; i++) {
        for (int j = 0; j < MAX; j++) {
            MatrixPos *pos = (MatrixPos *)malloc(sizeof(MatrixPos));
            pos->row = i;
            pos->col = j;
            pthread_create(&threads_mul[i][j], NULL, matrix_multiply, (void *)pos);
        }
    }

    // Join multiplication threads
    for (int i = 0; i < MAX; i++) {
        for (int j = 0; j < MAX; j++) {
            pthread_join(threads_mul[i][j], NULL);
        }
    }

    // Display multiplication result
    printf("\nResult of matrix multiplication:\n");
    for (int i = 0; i < MAX; i++) {
        for (int j = 0; j < MAX; j++) {
            printf("%d ", result_mul[i][j]);
        }
        printf("\n");
    }

    return 0;
}

4.	Implementation of Classical problems (reader writer)  using Threads and Mutex
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define MAX_READERS 5
#define MAX_WRITERS 5

pthread_mutex_t read_write_lock;
pthread_mutex_t count_lock;
int read_count = 0; // Number of active readers
int shared_data = 0; // Shared resource

// Reader thread function
void *reader(void *arg) {
    int reader_id = *((int *)arg);

    // Lock for reading
    pthread_mutex_lock(&count_lock);
    read_count++;
    if (read_count == 1) {
        pthread_mutex_lock(&read_write_lock); // Lock the resource if it's the first reader
    }
    pthread_mutex_unlock(&count_lock);

    // Reading
    printf("Reader %d: reading data = %d\n", reader_id, shared_data);
    sleep(1); // Simulate reading time

    // Unlock for reading
    pthread_mutex_lock(&count_lock);
    read_count--;
    if (read_count == 0) {
        pthread_mutex_unlock(&read_write_lock); // Unlock the resource if it's the last reader
    }
    pthread_mutex_unlock(&count_lock);

    pthread_exit(0);
}

// Writer thread function
void *writer(void *arg) {
    int writer_id = *((int *)arg);

    // Lock for writing
    pthread_mutex_lock(&read_write_lock);
    
    // Writing
    shared_data++;
    printf("Writer %d: writing data = %d\n", writer_id, shared_data);
    sleep(1); // Simulate writing time
    
    pthread_mutex_unlock(&read_write_lock);
    pthread_exit(0);
}

int main() {
    pthread_t readers[MAX_READERS], writers[MAX_WRITERS];
    int reader_ids[MAX_READERS], writer_ids[MAX_WRITERS];

    // Initialize mutexes
    pthread_mutex_init(&read_write_lock, NULL);
    pthread_mutex_init(&count_lock, NULL);

    // Create reader threads
    for (int i = 0; i < MAX_READERS; i++) {
        reader_ids[i] = i + 1;
        pthread_create(&readers[i], NULL, reader, &reader_ids[i]);
    }

    // Create writer threads
    for (int i = 0; i < MAX_WRITERS; i++) {
        writer_ids[i] = i + 1;
        pthread_create(&writers[i], NULL, writer, &writer_ids[i]);
    }

    // Wait for all readers to finish
    for (int i = 0; i < MAX_READERS; i++) {
        pthread_join(readers[i], NULL);
    }

    // Wait for all writers to finish
    for (int i = 0; i < MAX_WRITERS; i++) {
        pthread_join(writers[i], NULL);
    }

    // Destroy mutexes
    pthread_mutex_destroy(&read_write_lock);
    pthread_mutex_destroy(&count_lock);

    return 0;
}

5.	Implementation of Classical problems( producer consumer)  using Threads and Mutex

#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>

#define BUFFER_SIZE 5 // Size of the buffer
#define NUM_ITEMS 10 // Number of items each producer will produce

// Shared buffer
int buffer[BUFFER_SIZE];
int count = 0; // Current number of items in the buffer

// Mutex and condition variables
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t not_empty = PTHREAD_COND_INITIALIZER;
pthread_cond_t not_full = PTHREAD_COND_INITIALIZER;

// Producer function
void* producer(void* arg) {
int item;
for (int i = 0; i < NUM_ITEMS; i++) {
item = rand() % 100; // Random item produced
pthread_mutex_lock(&mutex); // Lock the mutex

// Wait if the buffer is full
while (count == BUFFER_SIZE) {
pthread_cond_wait(&not_full, &mutex);
}

// Add item to the buffer
buffer[count] = item;
count++;
printf("Producer produced: %d\n", item);

// Signal consumer that the buffer is not empty
pthread_cond_signal(&not_empty);
pthread_mutex_unlock(&mutex); // Unlock the mutex

// Simulate the time taken to produce an item
usleep(rand() % 500000);
}

return NULL;
}

// Consumer function
void* consumer(void* arg) {
int item;
for (int i = 0; i < NUM_ITEMS; i++) {
pthread_mutex_lock(&mutex); // Lock the mutex

// Wait if the buffer is empty
while (count == 0) {
pthread_cond_wait(&not_empty, &mutex);
}

// Consume an item from the buffer
item = buffer[count - 1];
count--;
printf("Consumer consumed: %d\n", item);

// Signal producer that the buffer is not full
pthread_cond_signal(&not_full);
pthread_mutex_unlock(&mutex); // Unlock the mutex

// Simulate the time taken to consume an item
usleep(rand() % 500000);
}

return NULL;
}

int main() {
pthread_t prod_thread, cons_thread;

// Create producer and consumer threads
pthread_create(&prod_thread, NULL, producer, NULL);
pthread_create(&cons_thread, NULL, consumer, NULL);

// Wait for both threads to finish
pthread_join(prod_thread, NULL);
pthread_join(cons_thread, NULL);

// Cleanup
pthread_mutex_destroy(&mutex);
pthread_cond_destroy(&not_empty);
pthread_cond_destroy(&not_full);

return 0;
}

6.	Implementation of Classical problems (reader writer) using Threads and Semaphore. .(reader writer, producer consumer, dining philosopher)
#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>

// Global variables
sem_t resourceAccess;   // Semaphore to access the shared resource
sem_t readCountAccess;  // Semaphore to protect readCount variable
int readCount = 0;      // Counter for the number of readers
int sharedData = 0;     // Shared resource

// Reader function
void *reader(void *arg) {
    int readerId = *(int *)arg;

    // Entry section for readers
    sem_wait(&readCountAccess);  // Lock to modify readCount
    readCount++;
    if (readCount == 1) {
        // First reader locks resource access
        sem_wait(&resourceAccess);
    }
    sem_post(&readCountAccess);  // Unlock readCountAccess

    // Critical section for reading
    printf("Reader %d: read sharedData = %d\n", readerId, sharedData);
    sleep(1); // Simulate reading time

    // Exit section for readers
    sem_wait(&readCountAccess);
    readCount--;
    if (readCount == 0) {
        // Last reader unlocks resource access
        sem_post(&resourceAccess);
    }
    sem_post(&readCountAccess);

    return NULL;
}

// Writer function
void *writer(void *arg) {
    int writerId = *(int *)arg;

    // Entry section for writers
    sem_wait(&resourceAccess);  // Lock resource for exclusive access

    // Critical section for writing
    sharedData++;  // Modify the shared resource
    printf("Writer %d: wrote sharedData = %d\n", writerId, sharedData);
    sleep(1); // Simulate writing time

    // Exit section for writers
    sem_post(&resourceAccess);  // Unlock resource

    return NULL;
}

int main() {
    pthread_t readers[5], writers[5];
    int readerIds[5], writerIds[5];

    // Initialize semaphores
    sem_init(&resourceAccess, 0, 1);
    sem_init(&readCountAccess, 0, 1);

    // Create reader and writer threads
    for (int i = 0; i < 5; i++) {
        readerIds[i] = i + 1;
        writerIds[i] = i + 1;
        pthread_create(&readers[i], NULL, reader, &readerIds[i]);
        pthread_create(&writers[i], NULL, writer, &writerIds[i]);
    }

    // Wait for all threads to finish
    for (int i = 0; i < 5; i++) {
        pthread_join(readers[i], NULL);
        pthread_join(writers[i], NULL);
    }

    // Destroy semaphores
    sem_destroy(&resourceAccess);
    sem_destroy(&readCountAccess);

    return 0;
}

7.	Implementation of Classical problems (producer consumer,) using Threads and Semaphore. 
#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define BUFFER_SIZE 5  // Size of the buffer

int buffer[BUFFER_SIZE];
int in = 0, out = 0;   // Buffer indices for producer and consumer

// Semaphores
sem_t empty;           // Tracks empty slots in the buffer
sem_t full;            // Tracks filled slots in the buffer
sem_t mutex;           // Binary semaphore for mutual exclusion

// Producer function
void *producer(void *arg) {
    int producerId = *(int *)arg;
    
    for (int i = 0; i < 10; i++) { // Produce 10 items
        int item = rand() % 100;   // Randomly generate an item

        sem_wait(&empty);          // Wait if buffer is full
        sem_wait(&mutex);          // Lock mutex for exclusive access

        // Produce an item (critical section)
        buffer[in] = item;
        printf("Producer %d produced: %d\n", producerId, item);
        in = (in + 1) % BUFFER_SIZE; // Move to the next buffer slot

        sem_post(&mutex);           // Unlock mutex
        sem_post(&full);            // Signal that buffer has one more filled slot

        sleep(1); // Simulate time taken to produce an item
    }

    return NULL;
}

// Consumer function
void *consumer(void *arg) {
    int consumerId = *(int *)arg;

    for (int i = 0; i < 10; i++) { // Consume 10 items
        sem_wait(&full);           // Wait if buffer is empty
        sem_wait(&mutex);          // Lock mutex for exclusive access

        // Consume an item (critical section)
        int item = buffer[out];
        printf("Consumer %d consumed: %d\n", consumerId, item);
        out = (out + 1) % BUFFER_SIZE; // Move to the next buffer slot

        sem_post(&mutex);           // Unlock mutex
        sem_post(&empty);           // Signal that buffer has one more empty slot

        sleep(1); // Simulate time taken to consume an item
    }

    return NULL;
}

int main() {
    pthread_t producers[2], consumers[2];
    int producerIds[2] = {1, 2};
    int consumerIds[2] = {1, 2};

    // Initialize semaphores
    sem_init(&empty, 0, BUFFER_SIZE); // Start with all buffer slots empty
    sem_init(&full, 0, 0);            // Start with no filled slots
    sem_init(&mutex, 0, 1);           // Mutex for critical section

    // Create producer and consumer threads
    for (int i = 0; i < 2; i++) {
        pthread_create(&producers[i], NULL, producer, &producerIds[i]);
        pthread_create(&consumers[i], NULL, consumer, &consumerIds[i]);
    }

    // Wait for all threads to finish
    for (int i = 0; i < 2; i++) {
        pthread_join(producers[i], NULL);
        pthread_join(consumers[i], NULL);
    }

    // Destroy semaphores
    sem_destroy(&empty);
    sem_destroy(&full);
    sem_destroy(&mutex);

    return 0;
}

8.	Implementation of Classical problems (dining philosopher) using Threads and Semaphore. 
#include <stdio.h>

struct Process {
    int id;             // Process ID
    int arrivalTime;    // Arrival time of the process
    int burstTime;      // Burst time (execution time) required by the process
    int finishTime;     // Finish time
    int turnaroundTime; // Turnaround time
    int waitingTime;    // Waiting time
};

void calculateTimes(struct Process p[], int n) {
    int currentTime = 0;

    for (int i = 0; i < n; i++) {
        // If the process arrives after the current time, fast-forward time to its arrival
        if (currentTime < p[i].arrivalTime) {
            currentTime = p[i].arrivalTime;
        }
        
        // Calculate finish time for the process
        p[i].finishTime = currentTime + p[i].burstTime;
        
        // Calculate turnaround time and waiting time
        p[i].turnaroundTime = p[i].finishTime - p[i].arrivalTime;
        p[i].waitingTime = p[i].turnaroundTime - p[i].burstTime;
        
        // Update current time to the finish time of the current process
        currentTime = p[i].finishTime;
    }
}

void displayProcessInfo(struct Process p[], int n) {
    printf("ID\tArrival\tBurst\tFinish\tTurnaround\tWaiting\n");
    for (int i = 0; i < n; i++) {
        printf("%d\t%d\t%d\t%d\t%d\t\t%d\n",
               p[i].id, p[i].arrivalTime, p[i].burstTime,
               p[i].finishTime, p[i].turnaroundTime, p[i].waitingTime);
    }
}

int main() {
    int n;
    printf("Enter the number of processes: ");
    scanf("%d", &n);

    struct Process p[n];

    // Input arrival time and burst time for each process
    for (int i = 0; i < n; i++) {
        p[i].id = i + 1;
        printf("Enter arrival time and burst time for process %d: ", p[i].id);
        scanf("%d %d", &p[i].arrivalTime, &p[i].burstTime);
    }

    // Calculate times using FCFS scheduling
    calculateTimes(p, n);

    // Display process information with calculated times
    printf("\nProcess information:\n");
    displayProcessInfo(p, n);

    return 0;
}

9.	Write a program to compute the finish time, turnaround time and waiting time for the First come First serve

#include <stdio.h>

struct Process {
    int id;             // Process ID
    int arrivalTime;    // Arrival time of the process
    int burstTime;      // Burst time (execution time) required by the process
    int finishTime;     // Finish time
    int turnaroundTime; // Turnaround time
    int waitingTime;    // Waiting time
};

void calculateTimes(struct Process p[], int n) {
    int currentTime = 0;

    for (int i = 0; i < n; i++) {
        // If the process arrives after the current time, fast-forward time to its arrival
        if (currentTime < p[i].arrivalTime) {
            currentTime = p[i].arrivalTime;
        }
        
        // Calculate finish time for the process
        p[i].finishTime = currentTime + p[i].burstTime;
        
        // Calculate turnaround time and waiting time
        p[i].turnaroundTime = p[i].finishTime - p[i].arrivalTime;
        p[i].waitingTime = p[i].turnaroundTime - p[i].burstTime;
        
        // Update current time to the finish time of the current process
        currentTime = p[i].finishTime;
    }
}

void displayProcessInfo(struct Process p[], int n) {
    printf("ID\tArrival\tBurst\tFinish\tTurnaround\tWaiting\n");
    for (int i = 0; i < n; i++) {
        printf("%d\t%d\t%d\t%d\t%d\t\t%d\n",
               p[i].id, p[i].arrivalTime, p[i].burstTime,
               p[i].finishTime, p[i].turnaroundTime, p[i].waitingTime);
    }
}

int main() {
    int n;
    printf("Enter the number of processes: ");
    scanf("%d", &n);

    struct Process p[n];

    // Input arrival time and burst time for each process
    for (int i = 0; i < n; i++) {
        p[i].id = i + 1;
        printf("Enter arrival time and burst time for process %d: ", p[i].id);
        scanf("%d %d", &p[i].arrivalTime, &p[i].burstTime);
    }

    // Calculate times using FCFS scheduling
    calculateTimes(p, n);

    // Display process information with calculated times
    printf("\nProcess information:\n");
    displayProcessInfo(p, n);

    return 0;
}


10.	Write a program to compute the finish time, turnaround time and waiting time for the
 Shortest Job First (Preemptive and Non Preemptive) 

#include <stdio.h>
#include <stdlib.h>

typedef struct {
int pid; // Process ID
int bt; // Burst Time
int at; // Arrival Time
int ct; // Completion Time
int wt; // Waiting Time
int tat; // Turnaround Time
} Process;

void sort_by_arrival(Process p[], int n) {
for (int i = 0; i < n - 1; i++) {
for (int j = i + 1; j < n; j++) {
if (p[i].at > p[j].at) {
Process temp = p[i];
p[i] = p[j];
p[j] = temp;
}
}
}
}

void sort_by_burst_time(Process p[], int n) {
for (int i = 0; i < n - 1; i++) {
for (int j = i + 1; j < n; j++) {
if (p[i].bt > p[j].bt && p[i].at <= p[j].at) {
Process temp = p[i];
p[i] = p[j];
p[j] = temp;
}
}
}
}

void non_preemptive_sjf(Process p[], int n) {
sort_by_arrival(p, n);

int time = 0;
for (int i = 0; i < n; i++) {
if (p[i].at > time) {
time = p[i].at;
}

// Update completion time
time += p[i].bt;
p[i].ct = time;

// Calculate waiting time and turnaround time
p[i].tat = p[i].ct - p[i].at;
p[i].wt = p[i].tat - p[i].bt;
}

// Print results
printf("\nPID\tArrival Time\tBurst Time\tCompletion Time\tTurnaround Time\tWaiting Time\n");
for (int i = 0; i < n; i++) {
printf("%d\t%d\t\t%d\t\t%d\t\t%d\t\t%d\n", p[i].pid, p[i].at, p[i].bt, p[i].ct, p[i].tat, p[i].wt);
}
}

int main() {
int n;
printf("Enter the number of processes: ");
scanf("%d", &n);

Process p[n];
for (int i = 0; i < n; i++) {
printf("\nEnter details for process %d:\n", i + 1);
p[i].pid = i + 1;
printf("Arrival Time: ");
scanf("%d", &p[i].at);
printf("Burst Time: ");
scanf("%d", &p[i].bt);
}

non_preemptive_sjf(p, n);
return 0;
}



input :- 


3
0
6

2
8

4
7

12.	Write a program to compute the finish time, turnaround time and waiting time for the
 Round robin 

#include <stdio.h>
#include <stdlib.h>

typedef struct {
int pid; // Process ID
int bt; // Burst Time
int at; // Arrival Time
int ct; // Completion Time
int wt; // Waiting Time
int tat; // Turnaround Time
int rem_bt; // Remaining Burst Time (for Round Robin)
} Process;

void round_robin(Process p[], int n, int quantum) {
int time = 0;
int remaining = n;
int i = 0;

// Round Robin Scheduling
while (remaining > 0) {
if (p[i].rem_bt > 0) {
if (p[i].rem_bt <= quantum) {
time += p[i].rem_bt;
p[i].rem_bt = 0;
p[i].ct = time;
p[i].tat = p[i].ct - p[i].at;
p[i].wt = p[i].tat - p[i].bt;
remaining--;
} else {
p[i].rem_bt -= quantum;
time += quantum;
}
}
i = (i + 1) % n; // Circular queue
}

// Print results
printf("\nPID\tArrival Time\tBurst Time\tCompletion Time\tTurnaround Time\tWaiting Time\n");
for (int i = 0; i < n; i++) {
printf("%d\t%d\t\t%d\t\t%d\t\t%d\t\t%d\n", p[i].pid, p[i].at, p[i].bt, p[i].ct, p[i].tat, p[i].wt);
}
}

int main() {
int n, quantum;

// Input number of processes and quantum
printf("Enter the number of processes: ");
scanf("%d", &n);

Process p[n];

// Input process details (Arrival Time and Burst Time)
for (int i = 0; i < n; i++) {
p[i].pid = i + 1;
printf("\nEnter details for process %d:\n", i + 1);
printf("Arrival Time: ");
scanf("%d", &p[i].at);
printf("Burst Time: ");
scanf("%d", &p[i].bt);
p[i].rem_bt = p[i].bt; // Initialize remaining burst time
}

// Input the time quantum
printf("Enter the time quantum: ");
scanf("%d", &quantum);

// Perform Round Robin scheduling
round_robin(p, n, quantum);

return 0;
}
 
input :- 


4


0
5

1
4

2
6


3
3

4

13.	Write a program to check whether given system is in safe state or not using Banker’s  Deadlock Avoidance algorithm.

#include <stdio.h>
#include <stdbool.h>

#define MAX 10
#define RESOURCES 3

int available[RESOURCES];
int maximum[MAX][RESOURCES];
int allocation[MAX][RESOURCES];
int need[MAX][RESOURCES];
int processCount, resourceCount;

void inputData() {
printf("Enter number of processes: ");
scanf("%d", &processCount);

printf("Enter number of resources: ");
scanf("%d", &resourceCount);

printf("Enter available instances of each resource: \n");
for (int i = 0; i < resourceCount; i++) {
scanf("%d", &available[i]);
}

printf("Enter maximum demand of each process:\n");
for (int i = 0; i < processCount; i++) {
for (int j = 0; j < resourceCount; j++) {
scanf("%d", &maximum[i][j]);
}
}

printf("Enter allocated resources for each process:\n");
for (int i = 0; i < processCount; i++) {
for (int j = 0; j < resourceCount; j++) {
scanf("%d", &allocation[i][j]);
}
}

// Calculate the need matrix
for (int i = 0; i < processCount; i++) {
for (int j = 0; j < resourceCount; j++) {
need[i][j] = maximum[i][j] - allocation[i][j];
}
}
}

bool isSafe() {
int work[RESOURCES];
bool finish[MAX] = {false};
int safeSeq[MAX];
int count = 0;

// Initialize work with available resources
for (int i = 0; i < resourceCount; i++) {
work[i] = available[i];
}

// Try to find a safe sequence
while (count < processCount) {
bool found = false;
for (int i = 0; i < processCount; i++) {
if (!finish[i]) {
// Check if process i can be completed
bool canFinish = true;
for (int j = 0; j < resourceCount; j++) {
if (need[i][j] > work[j]) {
canFinish = false;
break;
}
}

if (canFinish) {
// Add allocated resources to work
for (int j = 0; j < resourceCount; j++) {
work[j] += allocation[i][j];
}

safeSeq[count++] = i;
finish[i] = true;
found = true;
break;
}
}
}

if (!found) {
printf("System is in an unsafe state.\n");
return false;
}
}

printf("System is in a safe state. Safe sequence is: ");
for (int i = 0; i < processCount; i++) {
printf("P%d ", safeSeq[i]);
}
printf("\n");
return true;
}

int main() {a
inputData();

if (!isSafe()) {
printf("No safe sequence exists. System is in an unsafe state.\n");
}

return 0;
}


input :- 
 5
3
3 3 2

7 5 3
3 2 2
9 0 2
2 2 2
4 3 3

0 1 0
2 0 0
3 0 2
2 1 1
0 0 2

14.	Write a program for Deadlock detection algorithm

 #include <stdio.h>
#include <stdlib.h>

#define MAX_PROCESSES 10
#define MAX_RESOURCES 10

// Adjacency matrix to represent the wait-for graph
int wait_for_graph[MAX_PROCESSES][MAX_PROCESSES];

// Function to initialize the wait-for graph (all values set to 0)
void initializeGraph(int num_processes) {
for (int i = 0; i < num_processes; i++) {
for (int j = 0; j < num_processes; j++) {
wait_for_graph[i][j] = 0;
}
}
}

// Function to add an edge to the wait-for graph (Process i waits for process j)
void addEdge(int i, int j) {
wait_for_graph[i][j] = 1;
}

// Function to detect a cycle in the wait-for graph
int isCyclicUtil(int v, int visited[], int recStack[], int num_processes) {
// Mark the current node as visited and add to the recursion stack
visited[v] = 1;
recStack[v] = 1;

// Recur for all the vertices adjacent to this vertex
for (int i = 0; i < num_processes; i++) {
if (wait_for_graph[v][i]) {
if (!visited[i] && isCyclicUtil(i, visited, recStack, num_processes)) {
return 1; // Cycle detected
} else if (recStack[i]) {
return 1; // Cycle detected
}
}
}

// Remove from recursion stack
recStack[v] = 0;
return 0;
}

// Function to detect deadlock by detecting a cycle in the wait-for graph
int detectDeadlock(int num_processes) {
int visited[MAX_PROCESSES] = {0};
int recStack[MAX_PROCESSES] = {0}; // Recursion stack to track the path

// Check for cycles in different DFS trees
for (int i = 0; i < num_processes; i++) {
if (!visited[i]) {
if (isCyclicUtil(i, visited, recStack, num_processes)) {
return 1; // Deadlock detected
}
}
}

return 0; // No deadlock detected
}

int main() {
int num_processes, num_edges;

// Get input from the user
printf("Enter the number of processes: ");
scanf("%d", &num_processes);

if (num_processes > MAX_PROCESSES) {
printf("The maximum allowed number of processes is %d\n", MAX_PROCESSES);
return -1;
}

// Initialize the wait-for graph
initializeGraph(num_processes);

// Input edges (waiting relationships between processes)
printf("Enter the number of edges (process relationships): ");
scanf("%d", &num_edges);

printf("Enter the edges (format: <i> <j> means process i waits for process j):\n");
for (int i = 0; i < num_edges; i++) {
int i, j;
scanf("%d %d", &i, &j);
if (i >= 0 && i < num_processes && j >= 0 && j < num_processes) {
addEdge(i, j);
} else {
printf("Invalid process number! Should be between 0 and %d.\n", num_processes - 1);
}
}

// Detect deadlock
if (detectDeadlock(num_processes)) {
printf("Deadlock detected in the system.\n");
} else {
printf("No deadlock detected.\n");
}

return 0;
}





INPUT :-
4
4

0 1
1 2
2 3
3 1


15.	Write a program to calculate the number of page faults for a reference string for the FIFO page replacement algorithms:

#include <stdio.h>

#include <stdlib.h>

void fifo_page_replacement(int reference_string[], int n, int frames) {
int page_faults = 0;
int memory[frames]; // To store the current pages in memory
int front = 0; // Pointer for FIFO replacement
int found; // Flag to check if the page is in memory

// Initialize memory with -1 (indicating empty slots)
for (int i = 0; i < frames; i++) {
memory[i] = -1;
}

printf("FIFO Page Replacement:\n");

for (int i = 0; i < n; i++) {
found = 0; // Reset the flag to 0 (assume the page is not found)

// Check if the page is already in memory
for (int j = 0; j < frames; j++) {
if (memory[j] == reference_string[i]) {
found = 1; // The page is in memory, no page fault
break;
}
}

// If the page was not found in memory, we have a page fault
if (!found) {
// Replace the page at the front of the FIFO queue
memory[front] = reference_string[i];
front = (front + 1) % frames; // Move the front pointer in FIFO order
page_faults++; // Increment the page fault count
printf("Page fault: %d -> [", reference_string[i]);
for (int k = 0; k < frames; k++) {
if (memory[k] == -1) {
printf(" -,");
} else {
printf(" %d,", memory[k]);
}
}
printf("\b]\n");
} else {
printf("Page hit: %d -> [", reference_string[i]);
for (int k = 0; k < frames; k++) {
if (memory[k] == -1) {
printf(" -,");
} else {
printf(" %d,", memory[k]);
}
}
printf("\b]\n");
}
}

printf("\nTotal page faults: %d\n", page_faults);
}

int main() {
int n, frames;

// Input: reference string length and page frames
printf("Enter the number of pages in the reference string: ");
scanf("%d", &n);

int reference_string[n];

printf("Enter the reference string (space-separated): ");
for (int i = 0; i < n; i++) {
scanf("%d", &reference_string[i]);
}

printf("Enter the number of page frames: ");
scanf("%d", &frames);

// Perform FIFO page replacement
fifo_page_replacement(reference_string, n, frames);

return 0;
}

input file :- 
12
7 0 1 2 0 3 0 4 2 3 0 3
4

16.	Write a program to calculate the number of page faults for a reference string for the LRU page replacement algorithms: 
#include <stdio.h>

int find_LRU(int time[], int n) {
    int min = time[0], pos = 0;
    for (int i = 1; i < n; i++) {
        if (time[i] < min) {
            min = time[i];
            pos = i;
        }
    }
    return pos;
}

int page_faults_LRU(int pages[], int n, int capacity) {
    int frame[capacity]; // Holds pages in memory
    int time[capacity];  // Tracks the time each page was last used
    int page_faults = 0, counter = 0;

    // Initialize frames with -1 to represent empty slots
    for (int i = 0; i < capacity; i++) {
        frame[i] = -1;
    }

    for (int i = 0; i < n; i++) {
        int page = pages[i];
        int found = 0;

        // Check if the page is already in the frame
        for (int j = 0; j < capacity; j++) {
            if (frame[j] == page) {
                found = 1;  // Page is found in frame
                time[j] = counter++; // Update last used time
                break;
            }
        }

        // If page is not found, it is a page fault
        if (!found) {
            int pos = -1;

            // If there is an empty slot, find it
            for (int j = 0; j < capacity; j++) {
                if (frame[j] == -1) {
                    pos = j;
                    break;
                }
            }

            // If no empty slot, replace the LRU page
            if (pos == -1) {
                pos = find_LRU(time, capacity);
            }

            // Replace the page at the LRU position with the new page
            frame[pos] = page;
            time[pos] = counter++;
            page_faults++;
        }

        // Display current frame contents
        printf("Frame: ");
        for (int j = 0; j < capacity; j++) {
            if (frame[j] == -1)
                printf("- ");
            else
                printf("%d ", frame[j]);
        }
        printf("\n");
    }

    return page_faults;
}

int main() {
    int n, capacity;

    printf("Enter the number of pages: ");
    scanf("%d", &n);

    int pages[n];
    printf("Enter the reference string (page numbers): ");
    for (int i = 0; i < n; i++)
        scanf("%d", &pages[i]);

    printf("Enter the frame capacity: ");
    scanf("%d", &capacity);

    int faults = page_faults_LRU(pages, n, capacity);
    printf("Total page faults: %d\n", faults);

    return 0;
}


17.	Write a program to calculate the number of page faults for a reference string for the Optimal page replacement algorithms: 

#include <stdio.h>

int find_optimal(int pages[], int memory[], int n, int current_index, int frames) {
int farthest = current_index, pos = -1;

// For each frame, find the page that will not be used for the longest time in the future
for (int i = 0; i < frames; i++) {
int j;
for (j = current_index; j < n; j++) {
if (memory[i] == pages[j]) {
if (j > farthest) {
farthest = j;
pos = i;
}
break;
}
}

// If a page is not going to be used again, return its position
if (j == n) {
return i;
}
}

// If all pages in frames are used in the future, return the position of the farthest page
return (pos == -1) ? 0 : pos;
}

int optimal_page_replacement(int pages[], int n, int frames) {
int memory[frames];
int page_faults = 0;
int found, pos;

// Initialize memory frames
for (int i = 0; i < frames; i++) {
memory[i] = -1;
}

for (int i = 0; i < n; i++) {
found = 0;

// Check if the page is already in memory
for (int j = 0; j < frames; j++) {
if (memory[j] == pages[i]) {
found = 1;
break;
}
}

// If the page is not found in memory
if (!found) {
page_faults++;

// If there is space in memory, put the page in the next available frame
if (i < frames) {
memory[i] = pages[i];
} else {
// Find the optimal page to replace
pos = find_optimal(pages, memory, n, i + 1, frames);
memory[pos] = pages[i];
}
}
}

return page_faults;
}

int main() {
int n, frames;


scanf("%d", &n);

int pages[n];

for (int i = 0; i < n; i++) {
scanf("%d", &pages[i]);
}


scanf("%d", &frames);

int page_faults = optimal_page_replacement(pages, n, frames);
printf("Total page faults using Optimal: %d\n", page_faults);

return 0;
}


input :-
12
7 0 1 2 0 3 0 4 2 3 0 3
3

18.	Write a program to simulate FCFS disk scheduling. Calculate total seek time.Print accepted input and output in tabular format

#include <stdio.h>
#include <stdlib.h>

void print_table(int requests[], int n, int head, int seek_time) {
printf("\nDisk Scheduling - FCFS\n");
printf("------------------------------------------------\n");
printf("| Request Order | Position | Seek Time (Head -> Request) |\n");
printf("------------------------------------------------\n");

int current_position = head;
for (int i = 0; i < n; i++) {
int seek_distance = abs(requests[i] - current_position);
printf("| %2d | %3d | %3d ms |\n", i+1, requests[i], seek_distance);
current_position = requests[i];
}
printf("------------------------------------------------\n");
printf("| Total Seek Time: %d ms |\n", seek_time);
printf("------------------------------------------------\n");
}

int fcfs_disk_scheduling(int requests[], int n, int head) {
int total_seek_time = 0;
int current_position = head;

for (int i = 0; i < n; i++) {
total_seek_time += abs(requests[i] - current_position);
current_position = requests[i];
}

return total_seek_time;
}

int main() {
int n, head;

// Input: Number of disk requests
printf("Enter the number of disk requests: ");
scanf("%d", &n);

int requests[n];

// Input: Disk request sequence
printf("Enter the disk requests (in sequence): ");
for (int i = 0; i < n; i++) {
scanf("%d", &requests[i]);
}

// Input: Initial head position
printf("Enter the initial head position: ");
scanf("%d", &head);

// Calculate total seek time using FCFS
int seek_time = fcfs_disk_scheduling(requests, n, head);

// Display the input and output in a tabular format
print_table(requests, n, head, seek_time);

return 0;
}


input :- 


5
98
183
37
122
14
50

19.	Write a program to simulate SSTF disk scheduling. Calculate total seek time.Print accepted input and output in tabular format

#include <stdio.h>
#include <stdlib.h>
#include <limits.h> // Include limits.h for INT_MAX

void print_table(int requests[], int n, int head, int total_seek_time, int seek_sequence[]) {
printf("\nDisk Scheduling - SSTF\n");
printf("------------------------------------------------\n");
printf("| Request Order | Position | Seek Time (Head -> Request) |\n");
printf("------------------------------------------------\n");

int current_position = head;
for (int i = 0; i < n; i++) {
int seek_distance = abs(seek_sequence[i] - current_position);
printf("| %2d | %3d | %3d ms |\n", i + 1, seek_sequence[i], seek_distance);
current_position = seek_sequence[i];
}
printf("------------------------------------------------\n");
printf("| Total Seek Time: %d ms |\n", total_seek_time);
printf("------------------------------------------------\n");
}

int find_closest_request(int requests[], int n, int head, int processed[]) {
int min_distance = INT_MAX; // Use INT_MAX instead of _INT_MAX_
int closest_index = -1;

for (int i = 0; i < n; i++) {
if (!processed[i]) { // If request has not been processed
int distance = abs(requests[i] - head);
if (distance < min_distance) {
min_distance = distance;
closest_index = i;
}
}
}
return closest_index;
}

int sstf_disk_scheduling(int requests[], int n, int head, int seek_sequence[]) {
int total_seek_time = 0;
int processed[n];
for (int i = 0; i < n; i++) {
processed[i] = 0; // Initialize all requests as unprocessed
}

for (int i = 0; i < n; i++) {
int closest_index = find_closest_request(requests, n, head, processed);
if (closest_index == -1) break;

processed[closest_index] = 1;
seek_sequence[i] = requests[closest_index];
total_seek_time += abs(head - requests[closest_index]);
head = requests[closest_index];
}

return total_seek_time;
}

int main() {
int n, head;

// Input: Number of disk requests
printf("Enter the number of disk requests: ");
scanf("%d", &n);

int requests[n];
int seek_sequence[n];

// Input: Disk request sequence
printf("Enter the disk requests (in sequence): ");
for (int i = 0; i < n; i++) {
scanf("%d", &requests[i]);
}

// Input: Initial head position
printf("Enter the initial head position: ");
scanf("%d", &head);

// Calculate total seek time using SSTF
int total_seek_time = sstf_disk_scheduling(requests, n, head, seek_sequence);

// Display the input and output in a tabular format
print_table(requests, n, head, total_seek_time, seek_sequence);

return 0;
}


input :-
5
98
183
37
122
14
50

20.	Write a program to simulate SCAN disk scheduling. Calculate total seek time.Print accepted input and output in tabular format

#include <stdio.h>
#include <stdlib.h>

void sort(int arr[], int n) {
for (int i = 0; i < n - 1; i++) {
for (int j = 0; j < n - i - 1; j++) {
if (arr[j] > arr[j + 1]) {
int temp = arr[j];
arr[j] = arr[j + 1];
arr[j + 1] = temp;
}
}
}
}

void print_table(int seek_sequence[], int seek_count, int total_seek_time) {
printf("\nDisk Scheduling - SCAN\n");
printf("------------------------------------------------\n");
printf("| Request Order | Position | Seek Time (Head -> Request) |\n");
printf("------------------------------------------------\n");

int current_position = seek_sequence[0];
for (int i = 1; i <= seek_count; i++) {
int seek_distance = abs(seek_sequence[i] - current_position);
printf("| %2d | %3d | %3d ms |\n", i, seek_sequence[i], seek_distance);
current_position = seek_sequence[i];
}
printf("------------------------------------------------\n");
printf("| Total Seek Time: %d ms |\n", total_seek_time);
printf("------------------------------------------------\n");
}

int scan_disk_scheduling(int requests[], int n, int head, int disk_size, int direction) {
int seek_sequence[n + 1];
int total_seek_time = 0;
int seek_count = 0;

// Add initial head position to seek sequence
seek_sequence[seek_count++] = head;

// Sort the requests
sort(requests, n);

int current_position = head;
int closest_index = 0;

// Find the closest request in the chosen direction
for (int i = 0; i < n; i++) {
if (requests[i] >= head) {
closest_index = i;
break;
}
}

// SCAN in the specified direction (0 = left, 1 = right)
if (direction == 1) {
// Move towards the end of the disk
for (int i = closest_index; i < n; i++) {
seek_sequence[seek_count++] = requests[i];
total_seek_time += abs(current_position - requests[i]);
current_position = requests[i];
}
// After reaching end, reverse direction if needed
if (current_position < disk_size - 1) {
total_seek_time += abs(current_position - (disk_size - 1));
current_position = disk_size - 1;
seek_sequence[seek_count++] = current_position;
}
// Move back towards the start
for (int i = closest_index - 1; i >= 0; i--) {
seek_sequence[seek_count++] = requests[i];
total_seek_time += abs(current_position - requests[i]);
current_position = requests[i];
}
} else {
// Move towards the start of the disk
for (int i = closest_index - 1; i >= 0; i--) {
seek_sequence[seek_count++] = requests[i];
total_seek_time += abs(current_position - requests[i]);
current_position = requests[i];
}
// After reaching start, reverse direction if needed
if (current_position > 0) {
total_seek_time += abs(current_position - 0);
current_position = 0;
seek_sequence[seek_count++] = current_position;
}
// Move back towards the end
for (int i = closest_index; i < n; i++) {
seek_sequence[seek_count++] = requests[i];
total_seek_time += abs(current_position - requests[i]);
current_position = requests[i];
}
}

// Display the table
print_table(seek_sequence, seek_count - 1, total_seek_time);
return total_seek_time;
}

int main() {
int n, head, disk_size, direction;

// Input: Number of disk requests
printf("Enter the number of disk requests: ");
scanf("%d", &n);

int requests[n];

// Input: Disk request sequence
printf("Enter the disk requests (in sequence): ");
for (int i = 0; i < n; i++) {
scanf("%d", &requests[i]);
}

// Input: Disk size and initial head position
printf("Enter the disk size: ");
scanf("%d", &disk_size);

printf("Enter the initial head position: ");
scanf("%d", &head);

// Input: Direction (0 for left, 1 for right)
printf("Enter the direction (0 = left, 1 = right): ");
scanf("%d", &direction);

// Calculate total seek time using SCAN
int total_seek_time = scan_disk_scheduling(requests, n, head, disk_size, direction);

printf("Total Seek Time using SCAN: %d ms\n", total_seek_time);

return 0;
}


input :-


5
98 183 37 122 14
200
50
1

21.	Write a program to simulate C-SCAN disk scheduling. Calculate total seek time.Print accepted input and output in tabular format

#include <stdio.h>
#include <stdlib.h>

#define MAX_REQUESTS 100

// Function to compare integers (used for sorting)
int compare(const void *a, const void *b) {
return (*(int *)a - *(int *)b);
}

// Function to calculate total seek time using C-SCAN
void calculateSeekTime(int requests[], int num_requests, int head, int disk_size) {
int total_seek_time = 0;
int left[MAX_REQUESTS], right[MAX_REQUESTS];
int left_count = 0, right_count = 0;

// Split the requests into left and right of the head
for (int i = 0; i < num_requests; i++) {
if (requests[i] < head)
left[left_count++] = requests[i];
else
right[right_count++] = requests[i];
}

// Sort the left and right requests
qsort(left, left_count, sizeof(int), compare);
qsort(right, right_count, sizeof(int), compare);

// Calculate the total seek time
total_seek_time += abs(head - right[0]); // Move to the rightmost request
total_seek_time += abs(disk_size - 1 - right[0]); // Move to the end of disk
total_seek_time += abs(disk_size - 1 - left[left_count - 1]); // Move to the leftmost request
total_seek_time += abs(left[left_count - 1] - 0); // Return to the start of disk

// Print the results in tabular format
printf("\nAccepted Input:\n");
printf("Disk size: %d\n", disk_size);
printf("Initial head position: %d\n", head);
printf("Request queue: ");
for (int i = 0; i < num_requests; i++) {
printf("%d ", requests[i]);
}
printf("\n\nOutput:\n");
printf("Head movement order: ");

// Print the order of head movements
for (int i = right_count - 1; i >= 0; i--) {
printf("%d ", right[i]);
}
printf("%d ", disk_size - 1); // Move to the end
for (int i = left_count - 1; i >= 0; i--) {
printf("%d ", left[i]);
}
printf("%d\n", 0); // Move to the start

printf("\nTotal seek time: %d\n", total_seek_time);
printf("Average seek time: %.2f\n", (float)total_seek_time / num_requests);
}

int main() {
int requests[MAX_REQUESTS];
int num_requests, head, disk_size;

// Input for disk size, initial head position, and requests
printf("Enter the disk size: ");
scanf("%d", &disk_size);
printf("Enter the initial head position: ");
scanf("%d", &head);
printf("Enter the number of requests: ");
scanf("%d", &num_requests);

printf("Enter the requests:\n");
for (int i = 0; i < num_requests; i++) {
scanf("%d", &requests[i]);
}

// Call function to calculate seek time and display results
calculateSeekTime(requests, num_requests, head, disk_size);

return 0;
}


input :- 


200
50
8

10 20 30 40 90 110 150 180

22.	Write a program  for following 1)  zombie process 2),orphan processes 3)sum of even numbers of an array in parent and odd numbers of an array in child process

23.	Write a shell script to perform following operations on   student database.
a) Insert b) Delete c)Update d)Search


24.	Write a program to read and copy the contents of file character by character, line by line.

#include <stdio.h>
#include <stdlib.h>

void copyFileContent(const char *sourceFile, const char *destinationFile) {
FILE *source, *destination;
char ch;

// Open source file in read mode
source = fopen(sourceFile, "r");
if (source == NULL) {
printf("Error: Could not open source file %s\n", sourceFile);
exit(1);
}

// Open destination file in write mode
destination = fopen(destinationFile, "w");
if (destination == NULL) {
printf("Error: Could not open destination file %s\n", destinationFile);
fclose(source);
exit(1);
}

// Read the source file character by character and write to the destination file
while ((ch = fgetc(source)) != EOF) {
fputc(ch, destination);
}

printf("File content copied successfully from %s to %s\n", sourceFile, destinationFile);

// Close the files
fclose(source);
fclose(destination);
}

int main() {
char sourceFile[100], destinationFile[100];

// Take input for source and destination files
printf("Enter source file name: ");
scanf("%s", sourceFile);
printf("Enter destination file name: ");
scanf("%s", destinationFile);

// Copy file content
copyFileContent(sourceFile, destinationFile);

return 0;
}


input :-




25.	Write a program to load ALP program from input file to main memory

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_MEMORY 1024   // Define the size of "main memory" (adjustable as needed)
#define MAX_INSTRUCTION_LENGTH 50   // Maximum length of each instruction

int main() {
    FILE *inputFile;
    char filePath[100];
    char memory[MAX_MEMORY][MAX_INSTRUCTION_LENGTH];  // Simulating main memory as an array of strings
    int memoryIndex = 0;  // Tracks the current position in memory

    // Get the input file path from the user
    printf("Enter the path of the ALP input file: ");
    scanf("%s", filePath);

    // Open the ALP input file
    inputFile = fopen(filePath, "r");
    if (inputFile == NULL) {
        perror("Error opening input file");
        return 1;
    }

    // Load the ALP instructions into memory, line by line
    while (fgets(memory[memoryIndex], MAX_INSTRUCTION_LENGTH, inputFile) != NULL) {
        // Remove newline character if present
        memory[memoryIndex][strcspn(memory[memoryIndex], "\n")] = '\0';

        memoryIndex++;

        // Check if memory limit is reached
        if (memoryIndex >= MAX_MEMORY) {
            printf("Memory overflow: ALP program is too large to fit in memory.\n");
            break;
        }
    }

    // Close the input file
    fclose(inputFile);

    // Display the loaded instructions in memory
    printf("Loaded ALP Program into Memory:\n");
    for (int i = 0; i < memoryIndex; i++) {
        printf("Memory[%d]: %s\n", i, memory[i]);
    }

    return 0;
}


26.	Write a program to check Opcode error in a given job and raise an interrupt.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX_INSTRUCTION_LENGTH 50
#define MAX_OPCODE_LENGTH 10

// List of valid opcodes (extend as needed)
const char *validOpcodes[] = {"MOV", "ADD", "SUB", "MUL", "DIV", "JMP", "CMP", "LOAD", "STORE"};
int validOpcodesCount = sizeof(validOpcodes) / sizeof(validOpcodes[0]);

// Function to check if an opcode is valid
bool isValidOpcode(const char *opcode) {
    for (int i = 0; i < validOpcodesCount; i++) {
        if (strcmp(opcode, validOpcodes[i]) == 0) {
            return true;
        }
    }
    return false;
}

int main() {
    FILE *inputFile;
    char filePath[100];
    char instruction[MAX_INSTRUCTION_LENGTH];
    char opcode[MAX_OPCODE_LENGTH];
    int lineNumber = 0;

    // Get the job (ALP file) path from the user
    printf("Enter the path of the ALP job file: ");
    scanf("%s", filePath);

    // Open the ALP job file
    inputFile = fopen(filePath, "r");
    if (inputFile == NULL) {
        perror("Error opening job file");
        return 1;
    }

    // Read instructions line by line and check for opcode validity
    while (fgets(instruction, MAX_INSTRUCTION_LENGTH, inputFile) != NULL) {
        lineNumber++;

        // Extract the opcode (first word in the instruction)
        sscanf(instruction, "%s", opcode);

        // Check if the opcode is valid
        if (!isValidOpcode(opcode)) {
            // Raise an interrupt for invalid opcode
            printf("Interrupt: Invalid Opcode '%s' found at line %d\n", opcode, lineNumber);
            continue;  // Continue checking remaining lines (or break if immediate stop is desired)
        }

        // If valid, display the instruction as is (for reference)
        printf("Line %d: %s", lineNumber, instruction);
    }

    // Close the file
    fclose(inputFile);

    return 0;
}

27.	Write a program to check Oprand error in a given job and raise an interrupt.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX_INSTRUCTION_LENGTH 50
#define MAX_OPCODE_LENGTH 10
#define MAX_OPERANDS 3

// Define valid opcodes and their operand requirements
typedef struct {
    char opcode[MAX_OPCODE_LENGTH];
    int expectedOperands;
} OpcodeInfo;

// Array of opcodes and their expected operand counts
const OpcodeInfo validOpcodes[] = {
    {"MOV", 2},
    {"ADD", 2},
    {"SUB", 2},
    {"MUL", 2},
    {"DIV", 2},
    {"JMP", 1},
    {"CMP", 2},
    {"LOAD", 2},
    {"STORE", 2},
    {"NOP", 0}  // Example of an opcode that takes no operands
};
int validOpcodesCount = sizeof(validOpcodes) / sizeof(validOpcodes[0]);

// Function to get the expected operand count for an opcode
int getExpectedOperands(const char *opcode) {
    for (int i = 0; i < validOpcodesCount; i++) {
        if (strcmp(opcode, validOpcodes[i].opcode) == 0) {
            return validOpcodes[i].expectedOperands;
        }
    }
    return -1;  // Return -1 if the opcode is invalid
}

int main() {
    FILE *inputFile;
    char filePath[100];
    char instruction[MAX_INSTRUCTION_LENGTH];
    char opcode[MAX_OPCODE_LENGTH];
    char operand1[MAX_OPCODE_LENGTH], operand2[MAX_OPCODE_LENGTH];
    int lineNumber = 0;

    // Get the ALP job file path from the user
    printf("Enter the path of the ALP job file: ");
    scanf("%s", filePath);

    // Open the ALP job file
    inputFile = fopen(filePath, "r");
    if (inputFile == NULL) {
        perror("Error opening job file");
        return 1;
    }

    // Read instructions line by line and check for operand errors
    while (fgets(instruction, MAX_INSTRUCTION_LENGTH, inputFile) != NULL) {
        lineNumber++;
        
        // Extract the opcode and operands (if any)
        int operandCount = sscanf(instruction, "%s %s %s", opcode, operand1, operand2);

        // Get the expected number of operands for the opcode
        int expectedOperands = getExpectedOperands(opcode);
        
        if (expectedOperands == -1) {
            // Invalid opcode found, report it
            printf("Interrupt: Invalid Opcode '%s' found at line %d\n", opcode, lineNumber);
            continue;
        }

        // Check if the actual operand count matches the expected operand count
        if (operandCount - 1 != expectedOperands) {  // -1 to exclude opcode itself
            printf("Interrupt: Operand error for Opcode '%s' at line %d. Expected %d operand(s), found %d.\n",
                   opcode, lineNumber, expectedOperands, operandCount - 1);
            continue;
        }

        // If valid, display the instruction as is (for reference)
        printf("Line %d: %s", lineNumber, instruction);
    }

    // Close the file
    fclose(inputFile);

    return 0;
}

