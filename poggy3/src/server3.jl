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
dbc = DBInterface.connect(MySQL.Connection,
                            "pgdb-1.cy6onqf2jyfs.us-east-2.rds.amazonaws.com",
                            "admin", "Musonda1991", db="pgdb1")

################################################################################

function createUser(name)
    DBInterface.execute(dbc, "INSERT INTO hb3 (name) VALUES ('$name')")
    # DBInterface.execute(dbc, "DELETE FROM hb3 WHERE (`name` = '')")
end

function getUsers()
    cur = DBInterface.execute(dbc, "SELECT name FROM hb3")
    df = DataFrame(cur)
    stringified_json = arraytable(df)
    return stringified_json
end

################################################################################
# UI ###########################################################################
################################################################################

# elements
form2 = """
<form action="/" method="POST" enctype="multipart/form-data">
  <input type="text" name="name" value="" />
  <input type="submit" value="name" />
</form>
"""

################################################################################

# routes
route("/") do
  html(form2)
end

# createUser("john")

route("/", method = POST) do
  createUser(postpayload(:name))
  "aloha $(postpayload(:name, "Anon")) "
  obj = getUsers()
  return obj
end

up()


################################################################################
