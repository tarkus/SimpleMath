moment = require 'moment'

count   = 50
date    = moment().format("YYYY-MM-DD HH:mm:ss")

numbers    = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
opereators = ["+", "-"]

content = ""
answers = ""

for idx in [0...count]
  foo = numbers[Math.floor(Math.random() * numbers.length)]
  bar = numbers[Math.floor(Math.random() * numbers.length)]
  if foo < bar
    tmp = foo
    foo = bar
    bar = tmp
  opereator = opereators[Math.floor(Math.random() * opereators.length)]
  eval("var answer = " + foo + opereator + bar)
  content += "<div class=\"questions\"><div class=\"question col-lg-4\"><span class='number'>#{foo}</span> #{opereator} #{bar} = </div></div>"
  answers += "<div class=\"answers\"><div class=\"question col-lg-4\"><span class='number'>#{foo}</span> #{opereator} #{bar} = " + answer + "</div></div>"
    

html = """
  <!doctype html>
  <html>
    <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <title>Simple Math</title>
      <link rel="stylesheet" href="./bootstrap.min.css" />
      <style>
        body {
          font-family: monospace;
        }

        .main {
          margin-top: 34px;   
          font-size: 1.40em;
          line-height: 1.65em;
        }

        .question {
          min-width: 200px   
        }

        header h1 {
          padding-left: 13px;
        }

        h6 {
          padding-left: 16px;
          font-style: italic;
          color: #aaa;
          font-size: 11px;
        }

        .pagebreak { 
          page-break-before: always; 
        }

        footer {
          margin: 30px 40px 40px 26px;
          text-align: left;
          font-style: italic;
          color: #aaa;
          font-size: 10px;
        }
      </style>
    </head>
    <body>
      <header class="container">
        <h3>Everyday Math</h3>
        <h6>#{date}</h6>
      </header>
      <div class="container main">
        #{content}
      </div>
      <div class="pagebreak"></div>
      <div class="container main">
        #{answers}
      </div>
      <footer></footer>
    </body>
  </html>
"""

require("fs").writeFileSync("index.html", html)
console.log("DONE")

module.exports = {}
