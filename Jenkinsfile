pipeline { 
    agent { label "kaniko" }  // popeye
    options {
        ansiColor('xterm')
        timestamps ()
        buildDiscarder(logRotator(numToKeepStr: '10'))
        // skipDefaultCheckout true
    }
    stages {
    //         stage('Build') { 
    //             steps { 
    //             withCredentials([file(credentialsId: 'config.json', variable: 'FILE')]) {
    // //              sh 'use $FILE'
    //                 container('kaniko') {
    //                     script {
    //                         sh '''
    //                             cat $FILE > /kaniko/.docker/config.json
    //                             /kaniko/executor --context `pwd` \
    //                                              --destination yurasdockers/popeye:sh
    //                         '''
    //                         }
    //                     }
    //                 }           
    //             }
    //         }
        stage('Test'){
            steps {
                sh 'echo "testing will be here"'
                sh '''
                    pwd
                    sleep 600
                    ls -al /bin/
                    whoami
                    #popeye -o junit --save --output-file tesJunit
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