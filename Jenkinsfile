pipeline { 
    agent any
    stages {
        stage('Compute Image Changes') {
            steps {
                echo 'Compute Image Changes' 
                sh "rhtap/gather-deploy-images.sh"  
            }
        }
        stage('verify EC') {
            steps {
                echo 'Validate Enteprise Contract.' 
                sh "rhtap/verify-enterprise-contract.sh"  
            }
        }  
    }
}