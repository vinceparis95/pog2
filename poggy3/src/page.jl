
module page

pa = "style='text-align:left;color:blue;padding:19px;font-family:Courier New';.accordion {background-color: #eee;}"


pager2 = """
<form action="/" method="POST" enctype="multipart/form-data">

  <body  $pa>

      <div $pa>
      friend
      <input type="checkbox" id="one" name="friend" value="?">
      </div>
      <div $pa>friend!
          <input type="text" name="friend" value="" />
      </div>
      <div $pa>ccg1
          <input type="text" name="cc_g1" value="" />
      </div>
      <div $pa>ccg3
          <input type="text" name="cc_g3" value="" />
      </div>
      <div $pa>jyg
          <input type="text" name="jyg_1" value="" />
      </div>
      <div $pa>yg
          <input type="text" name="yg_1" value="" />
      </div>
      <script>
          for (let i = 0; i < 5; i++) {
              document.write("Welcome to Friends :)");
          }
      </script>
      <div $pa>pg
          <input type="text" name="pg" value="" />
      </div>
      <div $pa>nucleus
          <input type="text" name="nucleus" value="" />
      </div>
      <div $pa>
        <input type="submit" value="submit" />
      </div>
  </body>
</form>
"""

export pager2
end
