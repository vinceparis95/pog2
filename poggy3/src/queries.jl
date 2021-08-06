
module queries
using Genie, Genie.Router, Genie.Renderer.Html, Genie.Requests
using MySQL, DBInterface
using JSON, JSONTables
using DataFrames

################################################################################
# DB FUNCTIONS #################################################################
################################################################################

# connection
con = DBInterface.connect(MySQL.Connection,
                            "pgdb-1.cy6onqf2jyfs.us-east-2.rds.amazonaws.com",
                            "admin", "Musonda1991", db="pgdb1")

# functions

function dropTable2()
    DBInterface.execute(con,"DROP TABLE pgdb1.log;")
end
dropTable2()
function createTable()
    DBInterface.execute(con,"CREATE TABLE pgdb1.log (friend varchar(255), cc_g1 int,cc_g3 int,jyg_1 int, yg_1 int,pg int, nucleus int);")
end
createTable()
function insertFriend2(friend,jyg_1,cc_g1,cc_g3,pg,yg_1,nucleus)
    DBInterface.execute(con, "INSERT INTO log (friend,jyg_1,cc_g1,cc_g3,pg,yg_1,nucleus) VALUES ('$friend', '$jyg_1','$cc_g1','$cc_g3', '$pg', '$yg_1','$nucleus' );")
end

function getFriends2()
    cur = DBInterface.execute(con, "SELECT * FROM log")
    df  = DataFrame(cur)
    friendList = convert(Vector,df[:, :friend])
    fil = filter(row -> row.friend ∈ friendList, df)
    return fil
end
getFriends2().friend



export dropTable2, createTable2, insertFriend2, getFriends2

end
