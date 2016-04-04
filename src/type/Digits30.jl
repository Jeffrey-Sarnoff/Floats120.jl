AsIs = Val{:AsIs}

immutable Digit30 <: AbstractFloat
    hi::Float64
    lo::Float64
    
    Digit30(::Type{AsIs}, hi::Float64, lo::Float64) = new(hi,lo)
end

Digit30(AsIs,hi::Float64) = Digit30(AsIs,hi,0.0)

D30{T<:Float64}(hi::T, lo::T) = Digit30(AsIs,hi,lo)
D30{T<:Float64}(hi::T) = Digit30(AsIs,hi)

function Digit30{T<:Float64}(a::T, b::T) # hi,lo = eftAdd(a,b)
  hi = a + b
  t = hi - a
  lo = (a - (hi - t)) + (b - t)
  Digit30(AsIs,hi,lo)
end

function Dig30{T<:Float64}(a::T, b::T) # hi,lo = eftAddGTE(a,b)
  hi = a + b
  lo = b - (hi - a)
  Digit30(AsIs,hi,lo)
end

function show(io::IO, x::Digit30)
   s = string("Digit30(",x.hi,", ",x.lo,")")
   print(io, s)
end
