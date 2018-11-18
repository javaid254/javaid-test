#!/bin/sh
usage() { echo "Usage: $0 -u <user> -d <database name> -s <schema> [-p <password>]
               -u Database user name.
               -d Name of database to be created. If database already exists, then it will be dropped first.
               -s Name of schema to be created.
               -p Password for specified user.
               -h Display this help"; }

while getopts :u:p:d:s:h opt; do
    case $opt in
        u  ) user=$OPTARG;;
        p  )
             # this option is not recommended, probably need to find an alternative method of setting the password
             export PGPASSWORD=$OPTARG;;
        d  ) database=$OPTARG;;
        s  ) schema=$OPTARG;;
        h  ) usage; exit 0;;
        \? ) 
             echo "Invalid option: -$OPTARG" >&2
             usage
             exit 1;;
        :  ) echo "Option -$OPTARG requires an argument." >&2; exit 1;;
    esac
done

if [ -z "$user" ] || [ -z "$database" ] || [ -z "$schema" ]; then
    echo "Mandatory parameter(s) have not been provided" >&2
    usage 
    exit 1;
fi

psql -U $user -v dbname=$database -v user=$user -v schema=$schema -a -f init.sql
psql -U $user -d $database -v user=$user -a -f asset_registry_tables.sql
#psql -U $user -d $database -a -f asset_registry_fkeys.sql
