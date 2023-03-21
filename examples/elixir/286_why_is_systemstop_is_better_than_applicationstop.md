### Question
Why is System.stop/0 is better than Application.stop/1?


### Answer
`Application.stop/1` stops only the specified application, leaving
dependencies (other applications) running. To stop the entire system in
a controlled way, you can invoke `System.stop/0`. This function will
take down all the OTP applications, and then the BEAM instance itself.
Both `Application.stop/1` and `System.stop/0` work in a polite way -
every process in the supervision tree can perform some final cleanup in
its `terminate/1` callback.


