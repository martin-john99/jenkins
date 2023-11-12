pipeline {
    agent any

    environment {
        VCENTER_SERVER = 'vcenter.ptl.lan'
        VCENTER_USER = 'administrator@vsphere.local'
        VCENTER_PASSWORD = 'Zbear!1015'
        VM_HOST = 'r730xd-esxi.ptl.lan'
        TEMPLATE_NAME = 'Ubuntu'
        NEW_VM_NAME = 'new-vm'
    }

    stages {
        stage('Create VM from Template') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'vcenter', usernameVariable: 'VCENTER_USER', passwordVariable: 'VCENTER_PASSWORD')]) {
                        sh '''
                        echo "
                        Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:\$false
                        Connect-VIServer -Server '${VCENTER_SERVER}' -User '${VCENTER_USER}' -Password '${VCENTER_PASSWORD}'
                        \$vmhost = Get-VMHost 'r730xd-esxi.ptl.lan'
                        \$template = Get-Template -Name 'Ubuntu' -Location \$vmhost
                        New-VM -Name 'new-vm' -Template \$template -VMHost \$vmhost
                        Disconnect-VIServer -Server '${VCENTER_SERVER}' -Confirm:\$false
                        " | /usr/bin/pwsh
                        '''
                    }
                }
            }
        }
    }
}
