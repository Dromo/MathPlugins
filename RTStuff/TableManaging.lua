function tableContains(T, element)
	for _, value in pairs(T) do
		if value == element then
			return true
		end
	end
	return false
end

function tableIndexOf(T,val)
    for k,v in pairs(T) do 
        if v == val then return k end
    end
end

function tableLength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function extractPatterns( str, first, other, first_offset )
	local s,e = str:find(first); -- pair of values: start and end of the pattern
	if s~=nil then
		local t = {}
		if first_offset~=nil then
			e = e+first_offset
		end
		while s~=nil do
			table.insert(t, str:sub(s,e));
			s,e = str:find(other,e)
		end
		return t
	end
end