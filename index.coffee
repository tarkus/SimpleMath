moment = require 'moment'

count   = 50
date    = moment().format("YYYY-MM-DD HH:mm:ss")

numbers    = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
opereators = ["+", "-"]

content = ""

for idx in [0...count]
  foo = numbers[Math.floor(Math.random() * numbers.length)]
  bar = numbers[Math.floor(Math.random() * numbers.length)]
  if foo < bar
    tmp = foo
    foo = bar
    bar = tmp
  opereator = opereators[Math.floor(Math.random() * opereators.length)]
  content += "<div class=\"question col-lg-4\"><span class='number'>#{foo}</span> #{opereator} #{bar} = </div>"
    

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
          font-size: 1.55em;
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
        <h1>Everyday Math</h1>
        <h6>#{date}</h6>
      </header>
      <div class="container main">
        #{content}
      </div>
      <footer></footer>
    </body>
  </html>
"""

require("fs").writeFileSync("index.html", html)
console.log("DONE")
