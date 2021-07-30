using Genie, Genie.Router, Genie.Requests
include("src/server2.jl")
using .jawn






desc3 = "DESCRIBE hb3;"

cur = DBInterface.execute(dbc, desc3) #get tables

df = DataFrame(cur)
yz3= df.Field
yy3 = yz3[1]
yy3


route("/") do
  serve_static_file("welcome.html")
end

hi = ":) ^ <3333"

route("/ob") do
" hi "
end
