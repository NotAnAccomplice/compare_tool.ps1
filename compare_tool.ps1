#This is a script to compare two lists of items from a csv.

#Define the current location in a variable
$current_location = pwd

#Import the compare csv, and assign it to a variable
$csv_source = import-csv "$current_location\compare.csv"

#Define array variable we'll use later.
$compare_list_1 = @()
$compare_list_2 = @()
$UserOutput = @()

#Put each column of the CSV into its own array variable.
$csv_source | ForEach-Object {
    $compare_list_1 += $_.compare_list_1
    $compare_list_2 += $_.compare_list_2

}

    ForEach ($record in $compare_list_1)
    {

        $userMatch = $compare_list_2 | where {$_ -eq $record}
        If($userMatch)
        {
            #Process the data
            $UserOutput += "$record | match!"
        }
        else
        {
        $UserOutput += "$record | no match :("
        }
    }
$UserOutput | out-file -FilePath .\compareresults.csv

#write-output $UserOutput

#test start
#Read-Host
#test end

