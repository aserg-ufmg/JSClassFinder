# JSClassFinder
Detecting class-like structures in JavaScript

It is a research project to study the &#8220;emulation&#8221; of classes in JavaScript (JS) applications.<br />
JSClassFinder is the tool to detect class-like structures in JS software.</p>
<p><strong>Talk</strong></p>
<p><script async class="speakerdeck-embed" data-id="f0f3140ca74048dbb22e4bb10fee8be5" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script></p>
<p><strong>Installation</strong></p>
<p>The source code is implemented in <a href="http://pharo.org/" title="Pharo">Pharo</a>.<br />
You can download a ready-to-use Pharo image <a href="https://drive.google.com/file/d/0B-ZbjmvQs5bXQXlEQmxCa0tiSUE/view?usp=sharing" title="Ready-to-use Pharo image">here</a>, or use the instructions below to install JSClassFinder inside your own Pharo image:<br />
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
<p><a href="http://www.dcc.ufmg.br/~mtov/pub/2015_saner.pdf"> <img src="http://aserg.labsoft.dcc.ufmg.br/wordpress/wp-content/plugins/papercite/img/pdf.png" alt="[PDF]" /></a>  Leonardo Silva, Miguel Ramos, Marco Tulio Valente, Nicolas Anquetil, Alexandre Bergel. Does Javascript Software Embrace Classes? In <em>22nd International Conference on Software Analysis, Evolution and Reengineering (SANER) </em>, pages 1-10, 2015. 

<p><strong>Download</strong></p>
<p><a href="https://drive.google.com/file/d/0B-ZbjmvQs5bXQXlEQmxCa0tiSUE/view?usp=sharing" title="Ready-to-use Pharo image">Ready-to-use Pharo image with JSClassFinder installed</a><br />
<a href="http://smalltalkhub.com/#!/~LeonardoHumberto/JSClasses" title="JSClassFinder Tool">JSClassFinder packages</a><br />
<a href="http://aserg.labsoft.dcc.ufmg.br/qualitas.js/qualitas.js.rar" title="Dataset">Dataset</a></p>
