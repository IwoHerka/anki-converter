### Question
What is the difference between OTP app and Mix project?


### Answer
<div>

<div>

<div>

<div>

<div>

An OTP application is a **runtime** **construct**: a resource file
that's dynamically interpreted by the corresponding OTP-specific code.
When using mix, you describe some aspects of this file, and other
aspects are derived from your code. But the application itself has
meaning only at runtime.

</div>

<div>

In contrast, a mix project is a **compile-time construct**. In the
mix.exs file, you describe your application and implement modules. The
compilation process then produces an application resource file. 

</div>

</div>

</div>

</div>

</div>


