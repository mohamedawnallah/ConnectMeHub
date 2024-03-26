property mainNetworkSSIDs : {"New_SSID_1", "New_SSID_2"} -- Modify the main network SSIDs here
property backupNetworkSSIDs : {"New_SSID_3"} -- Modify the backup network SSIDs here

on connectToNetwork(networkSSID)
    set passwordQuoted to quoted form of getPasswordFromKeychain(networkSSID)
    if passwordQuoted is not missing value then
        if networkExists(networkSSID) then
			set currentNetworkSSIDQuoted to quoted form of currentNetworkSSID()
			set networkSSIDQuoted to quoted form of networkSSID
            if currentNetworkSSIDQuoted is not equal to networkSSIDQuoted then
                do shell script "/usr/sbin/networksetup -setairportnetwork en0 " & networkSSIDQuoted & " " & passwordQuoted
            end if
            return true
        else
            return false
        end if
    else
        return false
    end if
end connectToNetwork

on getPasswordFromKeychain(networkSSID)
    set keychainPassword to do shell script "/usr/bin/security find-generic-password -wa " & quoted form of networkSSID
    return keychainPassword
end getPasswordFromKeychain

on networkExists(networkSSID)
    set currentSSID to currentNetworkSSID()
    if currentSSID is networkSSID then
        return true
    else
        set networkList to do shell script "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"
        if networkList contains networkSSID then
            return true
        else
            return false
        end if
    end if
end networkExists


on currentNetworkSSID()
    set ssid to do shell script "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | awk -F': ' '/ SSID/ {print $2}'"
    return ssid
end currentNetworkSSID

on main()
    set mainNetworkConnected to false
    set backupNetworkConnected to false
    
    repeat with eachSSID in mainNetworkSSIDs
        if not mainNetworkConnected then
            set mainNetworkConnected to connectToNetwork(eachSSID)
        end if
    end repeat
    
    repeat with eachSSID in backupNetworkSSIDs
        if not mainNetworkConnected and not backupNetworkConnected then
            set backupNetworkConnected to connectToNetwork(eachSSID)
        end if
    end repeat
    
    if not mainNetworkConnected and not backupNetworkConnected then
        display notification "No suitable network found"
    end if
end main

main()
