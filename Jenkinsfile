pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('List VMs') {
            steps {
                sshagent(credentials: ['id_ecdsa']) {
                    sh 'ssh -o StrictHostKeyChecking=no root@r730xd-esxi "esxcli vm process list"'
                }
            }
        }

        stage('List Network Interfaces') {
            steps {
                sshagent(credentials: ['id_ecdsa']) {
                    sh 'ssh -o StrictHostKeyChecking=no root@r730xd-esxi "esxcli network nic list"'
                }
            }
        }
    }
}

