pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Run PS Script') {
            steps {
                sshagent(credentials: ['65139dcb-f15d-4508-b845-403924d9ecaf']) {
                    sh 'ssh root@r730xd-esxi "esxcli vm process list"'
                }
            }
        }

        stage('List Network Interfaces') {
            steps {
                sshagent(credentials: ['65139dcb-f15d-4508-b845-403924d9ecaf']) {
                    sh 'ssh root@r730xd-esxi "esxcli network nic list"'
                }
            }
        }

        stage('Check amount of memory installed') {
            steps {
                sshagent(credentials: ['65139dcb-f15d-4508-b845-403924d9ecaf']) {
                    sh 'ssh root@r730xd-esxi "esxcli hardware memory get"'
                }
            }
        }
    }
}
