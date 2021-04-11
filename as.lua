local moon_phase = { }
moon_phase[0] = "full moon"
moon_phase[1] = "waning gibbous"
moon_phase[2] = "Third quarter"
moon_phase[3] = "Waning crescent"
moon_phase[4] = "New moon"
moon_phase[5] = "Waxing crescent"
moon_phase[6] = "First quarter"
moon_phase[7] = "Waxing gibbous"

while true do
    term.clear()
    term.setCursorPos(1,1)

    local nTime = os.time()
    local nDay = os.day() - 1

    if nTime < 6 then
        nDay = nDay - 1
    end

    print( "The time is "..textutils.formatTime( nTime, false ).." on day "..nDay )

    print( "The phase of the moon is "..moon_phase[nDay%8] )

    print( "The eclipse index for today is "..nDay&36 )



end