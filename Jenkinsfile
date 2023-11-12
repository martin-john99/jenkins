pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm // This checks out your repository, including the get-date.ps1 script
            }
        }

        stage('Run PowerShell Script') {
            steps {
                script {
                    // Call the PowerShell script using pwsh (PowerShell Core)
                    sh 'pwsh -File get-date.ps1'
                }
            }
        }
    }

    post {
        // Your post-build actions
    }
}

