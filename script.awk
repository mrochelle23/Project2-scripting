#! /usr/bin/env gawk -f

BEGIN {
    FS = ","  # Set the field separator to comma
    # Initialize counters
    total_accidents = 0
    multi_vehicle_accidents = 0
    jan_feb_accidents = 0
    mi_accidents = 0
    mi_multi_vehicle_accidents = 0
    mi_jan_feb_accidents = 0
}
NR > 1 {  # Skipping header row
    total_accidents++
    
    # Proportion of Multiple Vehicles
    if ($3 >= 2) {
        multi_vehicle_accidents++
    }

    # Number of Accidents in January or February
    if ($13 == "1" || $13 == "2") {
        jan_feb_accidents++
    }

    # Proportion of Accidents in MI & in January/February
    if ($1 == "26") {
        mi_accidents++

        # MI Multiple Vehicles
        if ($3 >= 2) {
            mi_multi_vehicle_accidents++
        }

        # MI January or February
        if ($13 == "1" || $13 == "2") {
            mi_jan_feb_accidents++
        }
    }

    # Count drunk drivers by state
    state = $1
    drunk_drivers[state] += $52  # Accumulate the DRUNK_DR field by state
}

END {
    # Output proportions
    printf "Multiple Vehicles Proportion: %.6f\n", multi_vehicle_accidents / total_accidents
    printf "Jan/Feb Proportion: %.6f\n", jan_feb_accidents / total_accidents
    printf "MI Multiple Vehicles Proportion: %.6f\n", mi_multi_vehicle_accidents / mi_accidents
    printf "MI Jan/Feb Proportion: %d\n", mi_jan_feb_accidents / mi_accidents

    # Output state summary
    PROCINFO["sorted_in"] = "@ind_num_asc"  # Sort by state code
    print "State Code,# DD"
    for (state in drunk_drivers) {
        printf "%s,%d\n", state, drunk_drivers[state]
    }
}

