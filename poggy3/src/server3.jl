using Genie, Genie.Router, Genie.Renderer.Html, Genie.Requests
using MySQL, DBInterface
using JSON, JSONTables
using DataFrames
include("db/queries.jl")
using .queries

################################################################################
# DB FUNCTIONS #################################################################
################################################################################

# connection
con = DBInterface.connect(MySQL.Connection,
                            "pgdb-1.cy6onqf2jyfs.us-east-2.rds.amazonaws.com",
                            "admin", "Musonda1991", db="pgdb1")

# functions

function dropTable()
    DBInterface.execute(con,"DROP TABLE pgdb1.log;")
end
dropTable()

function createTable()
    DBInterface.execute(con,"CREATE TABLE pgdb1.log (friend varchar(255), network varchar(255), jyg_1 int,cc_g1 int,cc_g3 int,pg int,  yg_1 int);")
end
createTable()

function insertFriend(friend,network,jyg_1,cc_g1,cc_g3,pg,yg_1)
    DBInterface.execute(con, "INSERT INTO log (friend,network,jyg_1,cc_g1,cc_g3,pg,yg_1) VALUES ('$friend', '$network', '$jyg_1','$cc_g1','$cc_g3', '$pg', '$yg_1');")
end

function getFriends()
    cur = DBInterface.execute(con, "SELECT * FROM log")
    df  = DataFrame(cur)
    friendList = convert(Vector,df[:, :friend])
    fil = filter(row -> row.friend ∈ friendList, df)
    return fil
end
getFriends()
################################################################################
# UI ###########################################################################
################################################################################

pa = "style='color:blue;padding:19px'"
# elements

logForm = """
<form action="/" method="POST" enctype="multipart/form-data">
  <input type="datetime-local">
  <body  $pa>
      <div $pa>friend
          <input type="text" name="friend" value="" />
      </div>
      <div $pa>network
          <input type="text" name="network" value="" />
      </div>
      <div $pa>jyg
          <input type="text" name="jyg_1" value="" />
      </div>
      <div $pa>ccg1
          <input type="text" name="cc_g1" value="" />
      </div>
      <div $pa>ccg3
          <input type="text" name="cc_g3" value="" />
      </div>
      <div $pa>pg
          <input type="text" name="pg" value="" />
      </div>
      <div $pa>yg
          <input type="text" name="yg_1" value="" />
      </div>
      <div $pa>
        <input type="submit" value="submit" />
      </div>
  </body>
</form>
"""

################################################################################

# routes
route("/") do
  html(logForm)
end

# createUser("john")

route("/", method = POST) do
  insertFriend(postpayload(:friend),
               postpayload(:network),
               postpayload(:jyg_1),
               postpayload(:cc_g1),
               postpayload(:cc_g3),
               postpayload(:pg),
               postpayload(:yg_1))
  ob2 = getFriends()
  return ob2
end

up()

down()
################################################################################


# mutable struct transformer
#     logs::Array
#     unity::Float64
# end
#
# # UNPACK SAMPLE
# f=[]
#
# function unpack(DataFrame)
#   for row in eachrow(DataFrame)
#     v = vec(convert(Array, row))
#     x = transformer(v,0.1)
#     push!(f, x)
#   end
#   return f
# end
#
# ##################################################
# d = DataFrame(CSV.File("/home/vince/lg.csv"))
# unpack(d)
