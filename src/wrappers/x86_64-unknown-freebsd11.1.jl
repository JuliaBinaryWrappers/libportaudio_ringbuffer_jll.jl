# Autogenerated wrapper script for libportaudio_ringbuffer_jll for x86_64-unknown-freebsd11.1
export libpa_ringbuffer

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libpa_ringbuffer`
const libpa_ringbuffer_splitpath = ["lib", "libpa_ringbuffer.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libpa_ringbuffer_path = ""

# libpa_ringbuffer-specific global declaration
# This will be filled out by __init__()
libpa_ringbuffer_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libpa_ringbuffer = "libpa_ringbuffer.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"libportaudio_ringbuffer")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libpa_ringbuffer_path = normpath(joinpath(artifact_dir, libpa_ringbuffer_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libpa_ringbuffer_handle = dlopen(libpa_ringbuffer_path)
    push!(LIBPATH_list, dirname(libpa_ringbuffer_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

