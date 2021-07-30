module logger

####################
include("db/query.jl")
include("db/conn.jl")
using .query
using .conn
using CSV
using DataFrames
using MySQL

##################################################

##################################################

# LOAD

DBInterface.execute(dbcB, sq1)
res = DBInterface.execute(dbcB, sq2)
res = DBInterface.execute(dbcB, sq6c)
df = DataFrame(res)

##################################################

# extract columns from db or add new column
cur = DBInterface.execute(dbcB, sq3)
df = DataFrame(cur)

mutable struct transformer
    logs::Array
    unity::Float64
end

# UNPACK SAMPLE
f=[]

function unpack(DataFrame)
  for row in eachrow(DataFrame)
    v = vec(convert(Array, row))
    x = transformer(v,0.1)
    push!(f, x)
  end
  return f
end

##################################################
d = DataFrame(CSV.File("/home/vince/lg.csv"))
unpack(d)

end
