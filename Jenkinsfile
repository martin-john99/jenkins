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
                // This executes the list_vms.sh script
                script {
                    sh '''
                    chmod +x list_vms.sh
                    ./list_vms.sh
                    '''
                }
            }
        }
    }
}

