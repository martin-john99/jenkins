pipeline {
    agent any

    environment {
        VCENTER_SERVER = 'http://vcenter.ptl.lan'
        VCENTER_USER = 'administrator@vsphere.local'
        VCENTER_PASSWORD = 'Zbear!1015'
        VM_HOST = 'r730xd-esxi'
        TEMPLATE_NAME = 'Ubuntu'
        NEW_VM_NAME = 'new-vm'
    }

    stages {
        stage('Create VM from Template') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'vcenter', usernameVariable: 'VCENTER_USER', passwordVariable: 'VCENTER_PASSWORD')]) {
                        sh '''
                        #!/bin/bash
                        /usr/bin/pwsh -Command "& {
                            Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:\$false
                            Connect-VIServer -Server $VCENTER_SERVER -User \$env:VCENTER_USER -Password \$env:VCENTER_PASSWORD
                            \$vmhost = Get-VMHost \$VM_HOST
                            \$template = Get-Template -Name \$TEMPLATE_NAME -Location \$vmhost
                            New-VM -Name \$NEW_VM_NAME -Template \$template -VMHost \$vmhost
                            Disconnect-VIServer -Server \$VCENTER_SERVER -Confirm:\$false
                        }"
                        '''
                    }
                }
            }
        }
    }

    post {
        success {
            discordSend description: "Success! Build Succeeded: Job '${env.JOB_NAME}' #${env.BUILD_NUMBER}", webhookURL: 'Your Discord Webhook URL'
        }
        failure {
            discordSend description: "Failure! Build Failed: Job '${env.JOB_NAME}' #${env.BUILD_NUMBER}", webhookURL: 'Your Discord Webhook URL'
        }
        unstable {
            discordSend description: "Unstable! Build Unstable: Job '${env.JOB_NAME}' #${env.BUILD_NUMBER}", webhookURL: 'Your Discord Webhook URL'
        }
        always {
            discordSend description: "Finished! Build Finished: Job '${env.JOB_NAME}' #${env.BUILD_NUMBER}", webhookURL: 'Your Discord Webhook URL'
        }
    }
}
