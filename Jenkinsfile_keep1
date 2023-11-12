pipeline {
    agent any

<<<<<<< HEAD
    environment {
        VCENTER_SERVER = 'vcenter.ptl.lan'
        VCENTER_USER = 'administrator@vsphere.local'
        VCENTER_PASSWORD = 'Zbear!1015'
        VM_HOST = 'r730xd-esxi.ptl.lan'
        TEMPLATE_NAME = 'Ubuntu'
        NEW_VM_NAME = 'new-vm'
    }

=======
>>>>>>> 19aa50b (switching back to working Jenkinsfile)
    stages {
        stage('Checkout Code') {
            steps {
<<<<<<< HEAD
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
=======
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
>>>>>>> 19aa50b (switching back to working Jenkinsfile)
                }
            }
        }
    }
}

