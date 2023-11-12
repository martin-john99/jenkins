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

    post {
        success {
            discordSend description: "Success! Build Succeeded: Job '${env.JOB_NAME}' #${env.BUILD_NUMBER}", webhookURL: 'https://discord.com/api/webhooks/1172928868491989012/MgEZZPQI8xCuuY2LIhfIA8yGlbjha3gS84xrzBLSlHPkXu8tt3CWV6nqgIVrNasbiIvy'
        }
        failure {
            discordSend description: "Failure! Build Failed: Job '${env.JOB_NAME}' #${env.BUILD_NUMBER}", webhookURL: 'https://discord.com/api/webhooks/1172928868491989012/MgEZZPQI8xCuuY2LIhfIA8yGlbjha3gS84xrzBLSlHPkXu8tt3CWV6nqgIVrNasbiIvy'
        }
        unstable {
            discordSend description: "Unstable! Build Unstable: Job '${env.JOB_NAME}' #${env.BUILD_NUMBER}", webhookURL: 'https://discord.com/api/webhooks/1172928868491989012/MgEZZPQI8xCuuY2LIhfIA8yGlbjha3gS84xrzBLSlHPkXu8tt3CWV6nqgIVrNasbiIvy'
        }
    }
}
