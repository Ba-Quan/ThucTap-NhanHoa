#! /usr/bin/python
import os
import json
import datetime

class DBBackup():
    def __init__(self):
        self.configDir = '/etc/dbbackup/'
        self.configFile = '/etc/dbbackup/dbbackup.conf'
        self.configs = '{\n\t"BACKUP_PATH": "/Backups/",\n\t"DB_HOST": "localhost",\n\t"DB_PORT": 3306,\n\t"DB_USER": "root",\n\t"DB_PASS": "P@ssw0rd",\n\t"DB_NAMES": [\n\t\t"sys",\n\t\t"mysql",\n\t]\n}'
        self.initBackup()

    def initBackup(self):
        if not os.path.isdir(self.configDir):
            os.mkdir(self.configDir)

        if not os.path.isfile(self.configFile):
            with open(self.configFile, 'w+') as f:
                f.write(self.configs)

        with open(self.configFile) as f:
            self.configs = json.loads(f.read())
        
        if not os.path.isdir(self.configs['BACKUP_PATH']):
            os.mkdir(self.configs['BACKUP_PATH'])

    def backup(self):
        dumpcmd = 'mysqldump -h ' + self.configs['DB_HOST'] + ' -P ' + str(self.configs['DB_PORT']) + ' -u ' + self.configs['DB_USER'] + ' -p' + self.configs['DB_PASS'] + ' {dbName} > {output}'
        for dbName in self.configs['DB_NAMES']:
            _tmp = os.path.join(self.configs['BACKUP_PATH'], dbName)
            if not os.path.isdir(_tmp):
                os.mkdir(_tmp)
        
            output = os.path.join(self.configs['BACKUP_PATH'], dbName, dbName + '_' + now() + '.sql')

            try:
                os.system(dumpcmd.format(dbName=dbName, output=output))
                os.system('gzip ' + output)
            except Exception as e:
                print(datetime.datetime.now() + ' Error when backing up ' + dbName + ' ' + str(e))

def now():	
    now = datetime.datetime.now() 
    return now.strftime("%m-%d-%Y-%H-%M-%S")

if __name__ == '__main__':
    bk = DBBackup()
    bk.backup()

# Usage:
    # With crontab
    # Ex: * * * * * /path/to/MySQ-Backup-DB.py >> /path/to/log/file/MySQ-Backup-DB.py.log 2>&1
