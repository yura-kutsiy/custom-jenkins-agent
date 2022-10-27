pipeline { 
    agent { label "popeye" } 
    options {
        ansiColor('xterm')
        timestamps ()
        buildDiscarder(logRotator(numToKeepStr: '10'))
        // skipDefaultCheckout true
    }
    stages {
    // the code here can access $pass and $user
    //         stage('Build') { 
    //             steps { 
    //             withCredentials([file(credentialsId: 'config.json', variable: 'FILE')]) {
    // //              sh 'use $FILE'
    //                 container('kaniko') {
    //                     script {
    //                         sh '''
    //                             cat $FILE > /kaniko/.docker/config.json
    //                             /kaniko/executor --context `pwd` \
    //                                              --destination yurasdockers/jenkins-agent:0.1
    //                         '''
    //                     }
    //                 }
    //             }           
    //             }
    //         }
        stage('Test'){
            steps {
                sh 'echo "testing will be here"'
                sh '''
                    -o junit --save --output-file tesJunit
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "deploy with GitOps"'
            }
        }
    }
}