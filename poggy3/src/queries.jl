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

function dt2()
    DBInterface.execute(con,"DROP TABLE pgdb1.log;")
end
dt2()
function ct()
    DBInterface.execute(con,"CREATE TABLE pgdb1.log (friend varchar(255), cc_g1 int,cc_g3 int,jyg_1 int, yg_1 int,pg int, nucleus int);")
end
ct()

function insertFriend(friend,cc_g1,cc_g3,jyg_1,yg_1,pg,nucleus)
    DBInterface.execute(con, "INSERT INTO log (friend,cc_g1,cc_g3,jyg_1,yg_1,pg,nucleus) VALUES ('$friend', '$cc_g1','$cc_g3','$jyg_1', '$yg_1', '$pg','$nucleus' );")
end

function getFriends()
    cur = DBInterface.execute(con, "SELECT * FROM log")
    df  = DataFrame(cur)
    friendList = convert(Vector,df[:, :friend])
    filteredDf = filter(row -> row.friend ∈ friendList, df)
    return filteredDf
end
getFriends()



export dt2, ct, insertFriend, getFriends

end
