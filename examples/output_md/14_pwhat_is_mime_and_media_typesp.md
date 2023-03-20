### Question
What is MIME and media types.


### Answer
Because the Internet hosts many thousands of different data types, HTTP
carefully tags each object being transported through the Web with a data
format label called a MIME type. MIME (Multipurpose Internet Mail
Extensions) was originally designed to solve problems encountered in
moving messages between different electronic mail systems. MIME worked
so well for email that HTTP adopted it to describe and label its own
multimedia content.\
\
Web servers attach a MIME type to all HTTP object data. When a web
browser gets an object back from a server, it looks at the associated
MIME type to see if it knows how to handle the object. Most browsers can
handle hundreds of popular object types: displaying image files, parsing
and formatting HTML files, playing audio files through the computer's
speakers, or launching external plug-in software to handle special
formats.\
\
MIME type is a textual label, represented as a primary object type and a
specific subtype, separated by a slash. For example:\
\
• An HTML-formatted text document would be labeled with type
`text/html`.\
• A plain ASCII text document would be labeled with type `text/plain`.\
• A JPEG version of an image would beimage/jpeg.\
• A GIF-format image would be `image/gif`.


