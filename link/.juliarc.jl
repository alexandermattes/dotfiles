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

# Run _init.jl if it exists
macro init()
	if isfile("_init.jl")
		info("Found ", joinpath(pwd(),"_init.jl"))
		include("_init.jl")
	else
		print("_init.jl not found in current directory: $(pwd()). Create one instead? (y/n) ")
		rl = readline(STDIN)

		if first(rl) == 'y'
			edit("_init.jl")
		end
	end
end
