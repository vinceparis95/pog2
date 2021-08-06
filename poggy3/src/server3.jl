using Genie, Genie.Router, Genie.Renderer.Html, Genie.Requests
using MySQL, DBInterface
using JSON, JSONTables
using DataFrames
include("queries.jl")
using .queries
include("page.jl")
using .page

ob2f = queries.getFriends2().friend
page.m6
page.pager4

"""!!!!!!!!! to update list, need to create m5 = @sayhello, and run pager4 to update!!!!!!
"""
route("/") do
  runner()
  ob2f = queries.getFriends2().friend
  html(page.pager4, ob2f)
end

# createUser("john")
route("/", method = POST) do
  runner()

  queries.insertFriend2(postpayload(:friend),
               postpayload(:cc_g1),
               postpayload(:cc_g3),
               postpayload(:jyg_1),
               postpayload(:yg_1),
               postpayload(:pg),
               postpayload(:nucleus))
  ob2 = getFriends2()
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
