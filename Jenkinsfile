pipeline { 
    agent { label "default" }  // kaniko
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
    //                                              --destination yurasdockers/popeye:sh01
    //                         '''
    //                         }
    //                     }
    //                 }           
    //             }
    //         }
        stage('Test'){
            steps {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){
                sh 'echo "testing will be here"'
                sh '''
                    popeye -o junit --save --output-file test.xml
                    sleep 300
                '''
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "deploy with GitOps"'
                sh 'sleep 120'
                junit '/tmp/popeye/test.xml'
            }
        }
    } 
}