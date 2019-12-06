#!/bin/bash

# Default config
DB_BACKUP_PATH='/Backups'
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD='P@ssw0rd'
DATABASE_NAME='mysql'
TODAY=`date +"%Y-%m-%d-%H-%M-%S"`
OUTPUT=${DB_BACKUP_PATH}/${DATABASE_NAME}/${DATABASE_NAME}_${TODAY}.sql

# Help
show_help(){
    echo "
    -?   --help            show this help
    -des --destination     destination to storage databases 
    -h   --host            mysql host (default: localhost)
    -p   --port            mysql port (default: 3306)
    -u   --user            mysql user (default: root)
    -s   --secret          password of root user (default: P@ssw0rd)
    -d   --database        database to backup (default: sql)
    "
}

init(){
    mkdir -p ${DB_BACKUP_PATH}/${DATABASE_NAME}
    OUTPUT=${DB_BACKUP_PATH}/${DATABASE_NAME}/${DATABASE_NAME}_${TODAY}.sql
}

backup(){
    init

    mysqldump -h ${MYSQL_HOST} \
    		  -P ${MYSQL_PORT} \
    		  -u ${MYSQL_USER} \
    		  -p${MYSQL_PASSWORD} \
    		  ${DATABASE_NAME} | gzip > ${OUTPUT}.gz

    if [ $? -eq 0 ]; then
      echo 'Database backup successfully completed'
    else
      echo 'Error found during backup'
      exit 1
    fi
}

while :; do
    case $1 in
        -\?|--help)
            show_help
            exit ;;
        -des|--destination)
            if [ '$2' ]; then
                DB_BACKUP_PATH=$2; shift
            else
                die 'ERROR: "--destination" requires a non-empty option argument.'
            fi ;;
        --destination=?*)
            DB_BACKUP_PATH=${1#*=} ;;
        --destination=)
            die 'ERROR: "--destination" requires a non-empty option argument.' ;;

        -h|--host)
            if [ '$2' ]; then
                MYSQL_HOST=$2; shift
            else
                die 'ERROR: "--host" requires a non-empty option argument.'
            fi ;;
        --host=?*)
            MYSQL_HOST=${1#*=} ;;
        --host=)
            die 'ERROR: "--host" requires a non-empty option argument.' ;;
        
        -p|--port)
            if [ '$2' ]; then
                MYSQL_PORT=$2; shift
            else
                die 'ERROR: "--port" requires a non-empty option argument.'
            fi ;;
        --port=?*)
            MYSQL_PORT=${1#*=} ;;
        --port=)
            die 'ERROR: "--port" requires a non-empty option argument.' ;;

        -u|--user)
            if [ '$2' ]; then
                MYSQL_USER=$2s; shift
            else
                die 'ERROR: "--user" requires a non-empty option argument.'
            fi ;;
        --user=?*)
            MYSQL_USER=${1#*=} ;;
        --user=)
            die 'ERROR: "--user" requires a non-empty option argument.' ;;
        
        -s|--secret)
            if [ '$2' ]; then
                MYSQL_PASSWORD=$2; shift
            else
                die 'ERROR: "--secret" requires a non-empty option argument.'
            fi ;;
        --secret=?*)
            MYSQL_PASSWORD=${1#*=} ;;
        --secret=)
            die 'ERROR: "--secret" requires a non-empty option argument.' ;;

        -d|--database)
            if [ '$2' ]; then
                DATABASE_NAME=$2; shift
            else
                die 'ERROR: "--database" requires a non-empty option argument.'
            fi ;;
        --database=?*)
            DATABASE_NAME=${1#*=} ;;
        --database=)
            die 'ERROR: "--database" requires a non-empty option argument.' ;;
        *)
            break ;;
    esac
    shift
done

backup

# Usage:
    # With crontab:
    # Ex: * * * * * /path/to/MySQ-Backup-DB.sh -s P@ssw0rd -d sys >> /path/to/log/file/MySQ-Backup-DB.log 2>&1