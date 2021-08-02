using Genie, Genie.Router, Genie.Renderer.Html, Genie.Requests
using MySQL, DBInterface
using JSON, JSONTables
using DataFrames
include("db/queries.jl")
using .queries

################################################################################
# DB ###########################################################################
################################################################################

# connection
con = DBInterface.connect(MySQL.Connection,
                            "pgdb-1.cy6onqf2jyfs.us-east-2.rds.amazonaws.com",
                            "admin", "Musonda1991", db="pgdb1")

################################################################################

function insertFriend(friend,network,jyg_1,cc_g1,cc_g3,pg,yg_1)
    DBInterface.execute(con, "INSERT INTO log (friend,network,jyg_1,cc_g1,cc_g3,pg,yg_1) VALUES ('$friend', '$network', '$jyg_1','$cc_g1','$cc_g3', '$pg', '$yg_1');")
end
# function updateFriend()
DBInterface.execute(con, "DELETE FROM log WHERE (`friend` IS NULL)")
function selectFriends()
    cur = DBInterface.execute(con, "SELECT * FROM log")
    df  = DataFrame(cur)
    obj = json(df::Any)
    return obj
end

################################################################################
# UI ###########################################################################
################################################################################

# elements

logForm = """

<form action="/" method="POST" enctype="multipart/form-data">

  <input type="text" name="friend" value="" />
  <input type="submit" value="friend" />

  <input type="text" name="network" value="" />

  <input type="text" name="jyg_1" value="" />

  <input type="text" name="cc_g1" value="" />

  <input type="text" name="cc_g3" value="" />

  <input type="text" name="pg" value="" />

  <input type="text" name="yg_1" value="" />

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
  obj = selectFriends()
  return obj
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
