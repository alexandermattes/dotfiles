# Run _init.jl at runtime if it exists
if VERSION < v"0.4-"
	if isinteractive() && isfile("_init.jl")
		info("Found ", joinpath(pwd(),"_init.jl"))
		include(joinpath(pwd(),"_init.jl"))
	end
else
	atreplinit() do repl
		if isfile("_init.jl")
			info("Found ", joinpath(pwd(),"_init.jl"))
			include(joinpath(pwd(),"_init.jl"))
		end
	end
end
