# This file is a part of MJDSigGen, licensed under the MIT License (MIT).

__precompile__(true)

module MJDSigGen

# Make Pkg aware that deps.jl will require Libdl:
import Libdl

const deps_jl = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if isfile(deps_jl)
    include(deps_jl)
else
    error("MJDSigGen is not properly installed. Run Pkg.build(\"MJDSigGen\").")
end


macro sgsym(func)
    :(($(esc(func)), libmjd_siggen))
end

import Base

export SigGenSetup, read_config!, read_config, fieldgen, read_fields, signal_calc_init!,
    signal_calc_init, get_signal!, outside_detector, with_coll_effects!, coll_effects_off!,
    getδτ, getδτ!

using DelimitedFiles: readdlm

include("types.jl")
include("util.jl")
include("wrappers.jl")

end # module
