### Question
Explain how `receive` works under the hood.


### Answer
1.  We we enter a receive statement, we start a timer (but only if an
    after section is present in the expression).
2.  Take the first message in the mailbox and try to match it against
    Pattern1, Pattern2, and so on. If the match succeeds, the message is
    removed from the mailbox, and the expressions following the pattern
    are evaluated.
3.  If none of the patterns in the receive statement matches the first
    message and in the mailbox, then the first message is removed from
    the mailbox and put into a \"save queue\". The second message in the
    mailbox is then tried. This procedure is repeated until a matching
    message is found or until all the messages in the mailbox have been
    examined. If none of the messages in the mailbox matches, then the
    process is suspended and will be rescheduled for execution the next
    time a new message is put in the mailbox.
4.  When a new message arrives, the messages in the save queue are not
    rematched; only the new message is matched.
5.  As soon as a message has been matched, then all messages that have
    been put into a save queue are reentered into the mailbox in the
    order in which they arrived at the process. If a timer was set, it
    is cleared.
6.  If the timer elapses when we are waiting for a message, then
    evalaute the expressions ExpressionsTimeout and put any saved
    messages back into the mailbox in the order in which they arrived at
    the process.


