module structs


using Genie, Genie.Router, Genie.Renderer.Html, Genie.Requests
using MySQL, DBInterface
using JSON, JSONTables
using DataFrames

mutable struct friend
    chords::DataFrame
    eigenF::Expr
    correl::DataFrame
    circle::Float64
    eigens::Expr
    neural::Expr
    couple::Expr
end

mutable struct group
    chords::DataFrame
    eigenG::Expr
    growth::Float64
    neural::Expr
    circleG::Float64
    couple::Expr
    circle::Float64
end

mutable struct network
    chords::DataFrame
    eigensN::Expr
    growth::Float64
    correl::DataFrame
    neural::Expr
    couple::Expr
end

mutable struct neighborhood
    tilling::Float64
end

end
