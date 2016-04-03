# JSClassFinder
Detecting class-like structures in legacy JavaScript code (prior to ECMAScript 6).

<p><strong>Example of Class detected by JSClassFinder</strong></p>

```javascript
function Circle (radius) { //  class
   this.radius= radius; // attribute
   this.getArea= function () { // method
     return (3.14 * this.radius * this.radius);
   }
 }
 var myCircle = new Circle (10); // Circle instance
 ```

<p><strong>Installation</strong></p>
<p>JSClassFinder is implemented in <a href="http://pharo.org/" title="Pharo">Pharo</a> (a Smalltalk-like language) <br />
You can download a ready-to-use Pharo image <a href="https://drive.google.com/file/d/0B-ZbjmvQs5bXamZEbzN6LTluUTg/view?usp=sharing" title="Ready-to-use Pharo image">here</a>, or use the instructions below to install JSClassFinder inside your own Pharo image:<br />
1 &#8211; Open Monticello browser<br />
2 &#8211; Add a new repository (+Repository) of type HTTP<br />
3 &#8211; Fill in the required information as below<br />
&nbsp;<code>MCHttpRepository<br />
&nbsp;&nbsp;&nbsp;&nbsp;location: 'http://smalltalkhub.com/mc/LeonardoHumberto/JSClasses/main'<br />
&nbsp;&nbsp;&nbsp;&nbsp;user: ''<br />
&nbsp;&nbsp;&nbsp;&nbsp;password: '' </code><br />
4 &#8211; Choose the newest release</p>
<p><strong>Input</strong></p>
<p>JSClassFinder expects the AST of a JS source code, in JSON format, as input.<br />
To generate the AST we use <a href="http://esprima.org/" title="Esprima">Esprima</a>.<br />
Use the instructions below to use Esprima under <a href="http://nodejs.org/" title="Node.js">Node.js</a>:<br />
1- install Node.js<br />
2- load Esprima package : &#8220;npm install esprima&#8221;<br />
3- Ok, you are ready to execute Esprima commands. </p>
<p>The file <a href="http://java.llp.dcc.ufmg.br/mediawiki/images/0/09/Analysejs.zip" title="script">analyse.js</a> is one example of script that can be used to generate JSON files.</p>


<p><strong>More Info</strong></p>
 Leonardo Silva, Miguel Ramos, Marco Tulio Valente, Nicolas Anquetil, Alexandre Bergel. Does Javascript Software Embrace Classes? In <em>22nd International Conference on Software Analysis, Evolution and Reengineering (SANER) </em>, pages 1-10, 2015. 
 <a href="http://www.dcc.ufmg.br/~mtov/pub/2015_saner.pdf">Paper</a>, <a href="https://speakerdeck.com/aserg_ufmg/does-javascript-software-embrace-classes-saner-2015">Slides</a>

<p><strong>Download</strong></p>
<p><a href="https://drive.google.com/file/d/0B-ZbjmvQs5bXMnNHMjFMRFhCU2c/view?usp=sharing" title="Ready-to-use Pharo image">Ready-to-use Pharo image with JSClassFinder installed</a><br />
<a href="http://smalltalkhub.com/#!/~LeonardoHumberto/JSClasses" title="JSClassFinder Tool">JSClassFinder packages</a><br />
<a href="http://aserg.labsoft.dcc.ufmg.br/qualitas.js/qualitas.js.rar" title="Dataset">Dataset</a></p>
