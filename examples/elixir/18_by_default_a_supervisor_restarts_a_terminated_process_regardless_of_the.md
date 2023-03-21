### Question
By default, a supervisor restarts a terminated process **regardless of
the exit reason**.If you don\'t want your supervised process to be
restarted if it terminates with :normal, where do you configure it?


### Answer
<div>

<div>

<div>

You can set up a transient worker by providing **restart: :transient**
in your Worker\'s **child\_spec/1**. 

</div>

<div>

<div>

The following restart values are supported in the :restart option:

</div>

<div>

**:permanent** - the child process is always restarted

</div>

<div>

**:temporary** - the child process is never restarted (not even when the
supervisor\'s strategy is :rest\_for\_one or :one\_for\_all)

</div>

<div>

**:transient** - the child process is restarted only if it terminates
abnormally, i.e., with an exit reason other than :normal, :shutdown or
{:shutdown, term}

</div>

<div>

</div>

</div>

</div>

</div>


