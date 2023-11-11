pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // This checks out the code from your Git repository
                checkout scm
            }
        }

        stage('List VMs') {
            steps {
                // Use the sshagent to provide the SSH credentials
                sshagent(credentials: ['65139dcb-f15d-4508-b845-403924d9ecaf']) {
                    // Execute the command directly via SSH
                    sh 'ssh -o StrictHostKeyChecking=no root@r730xd-esxi "esxcli vm process list"'
                }
            }
        }
    }
}

