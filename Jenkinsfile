pipeline {
    agent any
    stages {
        stage('Run PowerShell on ESXi') {
            steps {
                script {
                    // Define ESXi host credentials using Jenkins credentials ID
                    def remote = [:]
                    remote.name = ''
                    remote.host = 'r730xd-esxi'
                    remote.user = 'root'
                    remote.credentialsId = '65139dcb-f15d-4508-b845-403924d9ecaf'

                    // Define the command to execute the PowerShell script
                    def command = "powershell -File /pa"

                    // Establish SSH connection and execute the command
                    sshCommand remote: remote, command: command
                }
            }
        }
    }
}

