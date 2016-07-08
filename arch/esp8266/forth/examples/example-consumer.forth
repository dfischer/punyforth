\ create a mailbox with size 4
4 mailbox.new: mailbox1

\ create a task for the consumer
0 task: task-consumer

\ this word is executed by the task
: consumer ( task -- )
    activate                            \ activate task
    begin    
        mailbox1 mailbox.receive .
        print: " received by consumer" cr
        pause                           \ allow other tasks to run
    again
    deactivate ;                        \ deactivate task

\ multi                                 \ switch to multitask mode
\ task-consumer consumer                \ run the consumer
\ 123 mailbox1 mailbox.send                     \ send some numbers to the consumer
\ 456 mailbox1 mailbox.send
