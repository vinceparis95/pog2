using Genie, Genie.Router, Genie.Renderer.Html, Genie.Requests
using MySQL, DBInterface
using JSON, JSONTables
using DataFrames
include("queries.jl")
using .queries
include("page.jl")
using .page


function zz()
  loggingPage = page.logFriend()
  return loggingPage
end


route("/") do
  html(zz())
end

# createUser("john")
route("/", method = POST) do
  queries.insertFriend(postpayload(:friend),
               postpayload(:cc_g1),
               postpayload(:cc_g3),
               postpayload(:jyg_1),
               postpayload(:yg_1),
               postpayload(:pg),
               postpayload(:nucleus))
  ob2 = getFriends()
  @xx
  # getFriends2
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
