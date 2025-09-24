function main()
    while true do
        if NETWORK.NETWORK_IS_SESSION_ACTIVE() and
           not NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
            NETWORK.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
        end

        SYSTEM.WAIT(2000)

        if NETWORK.NETWORK_IS_HOST_OF_THIS_SCRIPT() then
            print("success: host taken")
        else
            print("failed: still not host")
        end
    end
end