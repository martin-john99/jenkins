pipeline {
    agent any

    environment {
        // Define environment variables here
        VCENTER_SERVER = 'vcenter.ptl.lan'
        VCENTER_USER = 'administrator@vsphere.local'
        VCENTER_PASSWORD = 'Zbear!1015'
        VM_HOST = '192.168.10.97'
        TEMPLATE_NAME = 'Ubuntu'
        NEW_VM_NAME = 'pipeline-vm-test'
    }

    stages {
        stage('Create VM from Template') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'vcenter', usernameVariable: 'VCENTER_USER', passwordVariable: 'VCENTER_PASSWORD')]) {
                        sh '''
                        #!/bin/bash
                        /usr/bin/pwsh -Command "& {
                            Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
                            Connect-VIServer -Server $VCENTER_SERVER -User $env:VCENTER_USER -Password $env:VCENTER_PASSWORD
                            $vmhost = Get-VMHost $VM_HOST
                            $template = Get-Template -Name $TEMPLATE_NAME -Location $vmhost
                            New-VM -Name $NEW_VM_NAME -Template $template -VMHost $vmhost
                            Disconnect-VIServer -Server $VCENTER_SERVER -Confirm:$False
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
