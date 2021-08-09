module page

using MySQL, DBInterface
include("queries.jl")
using .queries


macro htmlFriends()
    str1 = ""
    friendList = getFriends().friend
    for x in friendList
        str = "<li>$x</li>\n"
        print(str)
        str1 = str1 * str
    end
    return str1
end

function logFriend()
    m1 = @htmlFriends
    pa = "style='text-align:left;color:blue;padding:19px;font-family:Courier New';.accordion {background-color: #eee;}"
    logPage = """
        <form action="/" method="POST" enctype="multipart/form-data">
        <script>
        for (let i=0; i<9;i++)
          document.write("hi");
        </script>
          <body  $pa> List of Friends
              $m1
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
        return logPage

    end

# <script>
#     for (let i = 0; i < 5; i++) {
#         document.write("Welcome to Friends! :)","\n");
#     }
# </script>

###############################################################################

export @friendLi
export pager1e

export logFriend


end
