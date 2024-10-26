#stackoverflow.com was used here
#My friends help was used here to decifer and fix errors
s/([^(]*) \([^)]*\)/\1/g
s/([A-Za-z]{3})-([0-9]{2}),([0-9]{4})/\3 (\1)/g
/^.*Deceased Characters.*$/d
