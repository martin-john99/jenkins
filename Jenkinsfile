pipeline {
    agent any

    environment {
        VCENTER_SERVER = 'vcenter.ptl.lan'
        // Other environment variables
    }

    stages {
        stage('Create VM from Template') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'vcenter', usernameVariable: 'VCENTER_USER', passwordVariable: 'VCENTER_PASSWORD')]) {
                        sh '''
                        /usr/bin/pwsh -Command "& {
                            Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:\$false
                            Connect-VIServer -Server '${VCENTER_SERVER}' -User '${VCENTER_USER}' -Password '${VCENTER_PASSWORD}'
                            \$vmhost = Get-VMHost 'r730xd-esxi.ptl.lan'
                            \$template = Get-Template -Name 'Ubuntu' -Location \$vmhost
                            New-VM -Name 'new-vm' -Template \$template -VMHost \$vmhost
                            Disconnect-VIServer -Server '${VCENTER_SERVER}' -Confirm:\$false
                        }"
                        '''
                    }
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
        always {
            discordSend description: "Finished! Build Finished: Job '${env.JOB_NAME}' #${env.BUILD_NUMBER}", webhookURL: 'https://discord.com/api/webhooks/1172928868491989012/MgEZZPQI8xCuuY2LIhfIA8yGlbjha3gS84xrzBLSlHPkXu8tt3CWV6nqgIVrNasbiIvy'
        }
    }
}
